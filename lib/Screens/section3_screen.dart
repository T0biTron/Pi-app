// ignore_for_file: use_super_parameters, unused_element, sort_child_properties_last, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/section2_screen.dart';
import 'package:flutter_application_1/Screens/section4_screen.dart';
import 'package:flutter_application_1/api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Section3Screen extends StatefulWidget {
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
  final int totalLocomotoraScore;
  final int totalPelotaScore;
  final int sumEP;
  final int ageScore;

  const Section3Screen({
    Key? key,
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
    required this.totalLocomotoraScore,
    required this.totalPelotaScore,
    required this.sumEP,
    required this.ageScore,
  }) : super(key: key);

  @override
  _Section3ScreenState createState() => _Section3ScreenState();
}

class _Section3ScreenState extends State<Section3Screen> {
  final TextEditingController _sumEPController = TextEditingController();
  final TextEditingController _rpController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();
  final TextEditingController _ic90Controller = TextEditingController();
  final TextEditingController _ic95Controller = TextEditingController();
  final TextEditingController _tdController = TextEditingController();

  void _saveData() {
    print('Suma de puntuaciones escaladas: ${_sumEPController.text}');
    print('Rango Percentil: ${_rpController.text}');
    print('Índice Motor Grueso: ${_imgController.text}');
    print('Intervalo de confianza: ${_ic90Controller.text}');
    print('Intervalo de confianza: ${_ic95Controller.text}');
    print('Término descriptivo: ${_tdController.text}');
  }

  @override
  void initState() {
    super.initState();
    _sumEPController.text = widget.sumEP.toString();
    if (widget.sumEP == 2) {
      _rpController.text = "<1";
      _imgController.text = "47";
      _ic90Controller.text = "44-57";
      _ic95Controller.text = "43-58";
    }
    if (widget.sumEP == 3) {
      _rpController.text = "<1";
      _imgController.text = "50";
      _ic90Controller.text = "47-50";
      _ic95Controller.text = "46-61";
    }
    if (widget.sumEP == 4) {
      _rpController.text = "<1";
      _imgController.text = "53";
      _ic90Controller.text = "50-63";
      _ic95Controller.text = "49-64";
    }
    if (widget.sumEP == 5) {
      _rpController.text = "<1";
      _imgController.text = "56";
      _ic90Controller.text = "53-65";
      _ic95Controller.text = "52-67";
    }
    if (widget.sumEP == 6) {
      _rpController.text = "<1";
      _imgController.text = "59";
      _ic90Controller.text = "56-68";
      _ic95Controller.text = "54-69";
    }
    if (widget.sumEP == 7) {
      _rpController.text = "1";
      _imgController.text = "62";
      _ic90Controller.text = "58-71";
      _ic95Controller.text = "57-72";
    }
    if (widget.sumEP == 8) {
      _rpController.text = "1";
      _imgController.text = "65";
      _ic90Controller.text = "61-74";
      _ic95Controller.text = "60-75";
    }
    if (widget.sumEP == 9) {
      _rpController.text = "2";
      _imgController.text = "68";
      _ic90Controller.text = "64-77";
      _ic95Controller.text = "63-78";
    }
    if (widget.sumEP == 10) {
      _rpController.text = "3";
      _imgController.text = "71";
      _ic90Controller.text = "67-79";
      _ic95Controller.text = "66-81";
    }
    if (widget.sumEP == 11) {
      _rpController.text = "4";
      _imgController.text = "73";
      _ic90Controller.text = "69-81";
      _ic95Controller.text = "67-82";
    }
    if (widget.sumEP == 12) {
      _rpController.text = "5";
      _imgController.text = "76";
      _ic90Controller.text = "71-84";
      _ic95Controller.text = "70-85";
    }
    if (widget.sumEP == 13) {
      _rpController.text = "8";
      _imgController.text = "79";
      _ic90Controller.text = "74-84";
      _ic95Controller.text = "73-88";
    }
    if (widget.sumEP == 14) {
      _rpController.text = "12";
      _imgController.text = "82";
      _ic90Controller.text = "77-90";
      _ic95Controller.text = "76-91";
    }
    if (widget.sumEP == 15) {
      _rpController.text = "16";
      _imgController.text = "85";
      _ic90Controller.text = "80-92";
      _ic95Controller.text = "79-94";
    }
    if (widget.sumEP == 16) {
      _rpController.text = "21";
      _imgController.text = "88";
      _ic90Controller.text = "83-95";
      _ic95Controller.text = "82-96";
    }
    if (widget.sumEP == 17) {
      _rpController.text = "27";
      _imgController.text = "91";
      _ic90Controller.text = "85-98";
      _ic95Controller.text = "84-99";
    }
    if (widget.sumEP == 18) {
      _rpController.text = "34";
      _imgController.text = "94";
      _ic90Controller.text = "88-101";
      _ic95Controller.text = "87-102";
    }
    if (widget.sumEP == 19) {
      _rpController.text = "42";
      _imgController.text = "97";
      _ic90Controller.text = "91-104";
      _ic95Controller.text = "90-105";
    }
    if (widget.sumEP == 20) {
      _rpController.text = "50";
      _imgController.text = "100";
      _ic90Controller.text = "94-106";
      _ic95Controller.text = "92-108";
    }
    if (widget.sumEP == 21) {
      _rpController.text = "58";
      _imgController.text = "103";
      _ic90Controller.text = "97-109";
      _ic95Controller.text = "95-110";
    }
    if (widget.sumEP == 22) {
      _rpController.text = "66";
      _imgController.text = "106";
      _ic90Controller.text = "99-112";
      _ic95Controller.text = "98-113";
    }
    if (widget.sumEP == 23) {
      _rpController.text = "73";
      _imgController.text = "109";
      _ic90Controller.text = "102-115";
      _ic95Controller.text = "101-116";
    }
    if (widget.sumEP == 24) {
      _rpController.text = "77";
      _imgController.text = "111";
      _ic90Controller.text = "104-117";
      _ic95Controller.text = "103-118";
    }
    if (widget.sumEP == 25) {
      _rpController.text = "82";
      _imgController.text = "114";
      _ic90Controller.text = "107-119";
      _ic95Controller.text = "106-121";
    }
    if (widget.sumEP == 26) {
      _rpController.text = "87";
      _imgController.text = "117";
      _ic90Controller.text = "110-122";
      _ic95Controller.text = "108-123";
    }
    if (widget.sumEP == 27) {
      _rpController.text = "91";
      _imgController.text = "120";
      _ic90Controller.text = "112-125";
      _ic95Controller.text = "111-126";
    }
    if (widget.sumEP == 28) {
      _rpController.text = "94";
      _imgController.text = "123";
      _ic90Controller.text = "115-128";
      _ic95Controller.text = "114-129";
    }
    if (widget.sumEP == 29) {
      _rpController.text = "96";
      _imgController.text = "126";
      _ic90Controller.text = "118-130";
      _ic95Controller.text = "117-132";
    }
    if (widget.sumEP == 30) {
      _rpController.text = "97";
      _imgController.text = "129";
      _ic90Controller.text = "121-133";
      _ic95Controller.text = "119-134";
    }
    if (widget.sumEP == 31) {
      _rpController.text = "98";
      _imgController.text = "132";
      _ic90Controller.text = "123-136";
      _ic95Controller.text = "122-137";
    }
    if (widget.sumEP == 32) {
      _rpController.text = "99";
      _imgController.text = "135";
      _ic90Controller.text = "126-139";
      _ic95Controller.text = "125-140";
    }
    if (widget.sumEP == 33) {
      _rpController.text = "99";
      _imgController.text = "138";
      _ic90Controller.text = "129-142";
      _ic95Controller.text = "128-143";
    }
    if (widget.sumEP == 34) {
      _rpController.text = ">99";
      _imgController.text = "141";
      _ic90Controller.text = "132-144";
      _ic95Controller.text = "131-146";
    }
    if (widget.sumEP == 35) {
      _rpController.text = ">99";
      _imgController.text = "144";
      _ic90Controller.text = "135-147";
      _ic95Controller.text = "133-148";
    }
    if (widget.sumEP == 36) {
      _rpController.text = ">99";
      _imgController.text = "146";
      _ic90Controller.text = "136-149";
      _ic95Controller.text = "135-150";
    }
    if (widget.sumEP == 37) {
      _rpController.text = ">99";
      _imgController.text = "149";
      _ic90Controller.text = "139-152";
      _ic95Controller.text = "138-153";
    }
    if (widget.sumEP == 38) {
      _rpController.text = ">99";
      _imgController.text = "152";
      _ic90Controller.text = "142-155";
      _ic95Controller.text = "141-156";
    }
    if (widget.sumEP == 39) {
      _rpController.text = ">99";
      _imgController.text = "155";
      _ic90Controller.text = "145-157";
      _ic95Controller.text = "144-159";
    }
    if (widget.sumEP == 40) {
      _rpController.text = ">99";
      _imgController.text = "158";
      _ic90Controller.text = "148-160";
      _ic95Controller.text = "146-161";
    }
    try {
      if (_imgController.text.isNotEmpty) {
        int img = int.parse(_imgController.text);
        if (img < 70) {
          _tdController.text = "Deterioro o retraso";
        } else if (img >= 70 && img <= 79) {
          _tdController.text = "Borde del deterioro o retraso";
        } else if (img >= 80 && img <= 89) {
          _tdController.text = "Por debajo del promedio";
        } else if (img >= 90 && img <= 109) {
          _tdController.text = "Promedio";
        } else if (img >= 110 && img <= 119) {
          _tdController.text = "Encima del promedio";
        } else if (img >= 120 && img <= 129) {
          _tdController.text = "Superior";
        } else if (img > 129) {
          _tdController.text = "Con talento o muy avanzado";
        }
      }
    } catch (e) {
      print('Error al procesar el índice motor gruesa: $e');
      // Opcionalmente puedes mostrar un mensaje al usuario
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Error al procesar el índice motor gruesa')),
      );
    }
  }

  Future<void> MotricidadGruesa() async {
    try {
      final motricidadData = {
        'suma_puntuaciones_escaladas': _sumEPController.text,
        'rango_percentil': _rpController.text,
        'indice_motor_gruesa': _imgController.text,
        'intervalo_confianza_90': _ic90Controller.text,
        'intervalo_confianza_95': _ic95Controller.text,
        'termino_descriptivo': _tdController.text,
      };

      final apiService = ApiService();
      final success = await apiService.saveMotricidadGruesa(motricidadData);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Datos de motricidad guardados correctamente')),
        );

        // Navegar a la siguiente pantalla
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Section4Screen(
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
              sumEP: widget.sumEP,
              ageScore: widget.ageScore,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Error al guardar los datos de motricidad')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sección 3', style: TextStyle(fontSize: 25)),
            Text('Composición de rendimiento', style: TextStyle(fontSize: 20)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Section2Screen(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Motricidad Gruesa',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _sumEPController,
                          decoration: const InputDecoration(
                              labelText: 'Suma de puntuaciones escaladas',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _rpController,
                          decoration: InputDecoration(
                              labelText: 'Rango Percentil',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _imgController,
                          decoration: InputDecoration(
                              labelText: 'Índice Motor Gruesa',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Intervalo de Confianza',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _ic90Controller,
                          decoration: InputDecoration(
                              labelText: '90%',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _ic95Controller,
                          decoration: InputDecoration(
                              labelText: '95%',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _tdController,
                          decoration: InputDecoration(
                              labelText: 'Término Descriptivo',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await MotricidadGruesa();
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 19, fontWeight: FontWeight.bold),
                      elevation: 18,
                      shadowColor:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 50),
                      minimumSize: const Size(200, 50),
                    ),
                    child: const Text('Siguiente'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
