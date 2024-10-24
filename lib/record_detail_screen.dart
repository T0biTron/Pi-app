import 'package:flutter/material.dart';

class RecordDetailScreen extends StatelessWidget {
  final Map<String, dynamic> record;

  const RecordDetailScreen({Key? key, required this.record}) : super(key: key);

  // Función para calcular la edad a partir de la fecha de nacimiento
  String calculateAge(String birthdate) {
    DateTime birthDate = DateTime.parse(birthdate);
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Nombre:', record['name']),
            _buildInfoRow('Género:', record['gender']),
            _buildInfoRow('Fecha de Nacimiento:', record['birthdate']),
            _buildInfoRow('Edad:', calculateAge(record['birthdate'])),
            _buildInfoRow('Fecha del Test:', record['testDate']),
            _buildInfoRow('Mano Preferida:', record['preferredHand'] ?? 'No especificado'),
            _buildInfoRow('Pie Preferido:', record['preferredFoot'] ?? 'No especificado'),
            _buildInfoRow('Puntaje Locomotora:', record['totalLocomotoraScore'].toString()),
            _buildInfoRow('Puntaje Pelota:', record['totalPelotaScore'].toString()),
            _buildInfoRow('Nombre del Examinador:', record['examinerName'] ?? 'Desconocido'),
            _buildInfoRow('Título del Examinador:', record['examinerTitle'] ?? 'Desconocido'),
          ],
        ),
      ),
    );
  }

  // Función para construir filas con subtítulos en negrita
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
