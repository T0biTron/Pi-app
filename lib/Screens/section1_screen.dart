// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/section2_screen.dart';
import 'package:flutter_application_1/form2_screen.dart';
import 'package:flutter_application_1/api_service.dart'; //

class Section1Screen extends StatefulWidget {
  final int totalLocomotoraScore;
  final int totalPelotaScore;
  final String name;
  final String? gender;
  final DateTime birthDate;
  final String school;
  final String? preferredHand;
  final String? preferredFoot;
  final String examinerName;
  final String examinerTitle;
  final DateTime testDate;
  final String calculatedAge;
  final int ageScore;

  const Section1Screen({
    Key? key,
    required this.totalLocomotoraScore,
    required this.totalPelotaScore,
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.school,
    required this.preferredHand,
    required this.preferredFoot,
    required this.examinerName,
    required this.examinerTitle,
    required this.testDate,
    required this.calculatedAge,
    required this.ageScore,
  }) : super(key: key);

  @override
  _Section1ScreenState createState() => _Section1ScreenState();
}

class _Section1ScreenState extends State<Section1Screen> {
  double _textSize = 16.0;

  // Función para manejar el envío de datos al presionar "Siguiente"
  void _onSubmit() async {
    if (!mounted) return;

    ApiService apiService = ApiService();

    // Paso 1: Guardar Institución y obtener el ID
    int? institutionId = await apiService.saveInstitution(widget.school);
    if (institutionId == null) {
      _showMessage("Error al guardar la institución.");
      return;
    }

    // Paso 2: Guardar Examinador y obtener el ID
    int? examinerId = await apiService.saveExaminer(
        widget.examinerName, widget.examinerTitle);
    if (examinerId == null) {
      _showMessage("Error al guardar el examinador.");
      return;
    }

    // Paso 3: Guardar Usuario con los IDs obtenidos
    Map<String, dynamic> userData = {
      "name": widget.name,
      "gender": widget.gender ?? "No especificado",
      "birthdate":
          "${widget.birthDate.year}-${widget.birthDate.month}-${widget.birthDate.day}",
      "totalLocomotoraScore": widget.totalLocomotoraScore,
      "totalPelotaScore": widget.totalPelotaScore,
      "institutionId": institutionId,
      "examinerId": examinerId,
      "testDate":
          "${widget.testDate.year}-${widget.testDate.month}-${widget.testDate.day}"
    };

    int? userId = await apiService.saveUser(userData);
    if (userId == null) {
      _showMessage("Error al guardar el usuario.");
      return;
    }

    // Paso 4: Guardar Datos Adicionales (Mano y Pie Preferidos)
    bool datosGuardados = await apiService.saveDatos(
        widget.preferredHand ?? "No especificado",
        widget.preferredFoot ?? "No especificado",
        userId);

    if (datosGuardados) {
      _showMessage("Datos guardados correctamente. Usuario ID: $userId");
      // Navegar a la siguiente pantalla solo si todo se guarda correctamente
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Section2Screen(
            totalLocomotoraScore: widget.totalLocomotoraScore,
            totalPelotaScore: widget.totalPelotaScore,
            name: widget.name,
            gender: widget.gender,
            birthDate: widget.birthDate,
            school: widget.school,
            preferredHand: widget.preferredHand,
            preferredFoot: widget.preferredFoot,
            examinerName: widget.examinerName,
            examinerTitle: widget.examinerTitle,
            testDate: widget.testDate,
            calculatedAge: widget.calculatedAge,
            ageScore: widget.ageScore,
            idUser: userId,
          ),
        ),
      );
    } else {
      _showMessage("Error al guardar los datos adicionales.");
    }
  }

  // Función para mostrar mensajes en pantalla
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sección 1', style: TextStyle(fontSize: 25)),
            Text('Información de Identificación',
                style: TextStyle(fontSize: 20)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Form2Screen(
                  name: widget.name,
                  gender: widget.gender,
                  birthDate: widget.birthDate,
                  school: widget.school,
                  preferredHand: widget.preferredHand,
                  preferredFoot: widget.preferredFoot,
                  examinerName: widget.examinerName,
                  examinerTitle: widget.examinerTitle,
                  testDate: widget.testDate,
                  calculatedAge: widget.calculatedAge,
                  totalLocomotoraScore: widget.totalLocomotoraScore,
                  totalPelotaScore: widget.totalPelotaScore,
                  ageScore: widget.ageScore,
                ),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('Nombre:', widget.name),
                _buildInfoRow('Colegio:', widget.school),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('Género:', widget.gender ?? 'No especificado'),
                _buildInfoRow('Mano Preferida:',
                    widget.preferredHand ?? 'No especificado'),
                _buildInfoRow('Pie Preferido:',
                    widget.preferredFoot ?? 'No especificado'),
              ],
            ),
            const SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Año       Mes      Día',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                _buildDateRow('Fecha del Test:', widget.testDate),
                const SizedBox(height: 10),
                _buildDateRow('Fecha de Nacimiento:', widget.birthDate),
                const SizedBox(height: 10),
                _buildAgeRow(),
              ],
            ),
            const SizedBox(height: 30),
            _buildInfoRow('Nombre del Examinador:', widget.examinerName),
            _buildInfoRow('Título del Examinador:', widget.examinerTitle),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed:
                  _onSubmit, // Llama a _onSubmit para guardar los datos primero
              style: ElevatedButton.styleFrom(
                textStyle:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                elevation: 18,
                shadowColor:
                    const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              ),
              child: const Text(
                'Siguiente',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label ',
          style: TextStyle(fontSize: _textSize, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: _textSize),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _buildDateRow(String label, DateTime date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: _textSize, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Text(_formatDate(date), style: TextStyle(fontSize: _textSize)),
        ),
      ],
    );
  }

  Widget _buildAgeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Edad:',
          style: TextStyle(fontSize: _textSize, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: _buildAgeValues(),
        ),
      ],
    );
  }

  Widget _buildAgeValues() {
    final ageParts = _extractAge();
    return Row(
      children: [
        Text(ageParts['years']!, style: TextStyle(fontSize: _textSize)),
        const SizedBox(width: 32),
        Text(ageParts['months']!, style: TextStyle(fontSize: _textSize)),
        const SizedBox(width: 32),
        Text(ageParts['days']!, style: TextStyle(fontSize: _textSize)),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}      ${_formatNumber(date.month)}       ${_formatNumber(date.day)}';
  }

  String _formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  Map<String, String> _extractAge() {
    final ageComponents = widget.calculatedAge.split(RegExp(r'\D+'));
    return {
      'years': ageComponents.isNotEmpty ? ageComponents[0] : '0',
      'months': ageComponents.length > 1 ? ageComponents[1] : '0',
      'days': ageComponents.length > 2 ? ageComponents[2] : '0',
    };
  }
}
