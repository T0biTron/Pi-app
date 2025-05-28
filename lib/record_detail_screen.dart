import 'package:flutter/material.dart';

class RecordDetailScreen extends StatelessWidget {
  final Map<String, dynamic> record;

  const RecordDetailScreen({super.key, required this.record});

  // Función para calcular la edad a partir de la fecha de nacimiento
  String calculateAge(String birthdate, String testDate) {
    DateTime birthDate = DateTime.parse(birthdate);
    DateTime testDateTime = DateTime.parse(testDate);

    int years = testDateTime.year - birthDate.year;
    int months = testDateTime.month - birthDate.month;
    int days = testDateTime.day - birthDate.day;

    if (days < 0) {
      months--;
      days += DateTime(testDateTime.year, testDateTime.month, 0).day;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    return '$years años, $months meses, $days días';
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
            _buildInfoRow('Nombre:', record['name'] ?? 'Desconocido'),
            _buildInfoRow('Género:', record['gender'] ?? 'Desconocido'),
            _buildInfoRow(
                'Fecha de Nacimiento:', record['birthdate'] ?? 'No registrada'),
            _buildInfoRow(
                'Fecha del Test:', record['testDate'] ?? 'No registrada'),
            _buildInfoRow(
                'Edad:',
                record.containsKey('birthdate') &&
                        record.containsKey('testDate')
                    ? calculateAge(record['birthdate'], record['testDate'])
                    : 'No disponible'),
            _buildInfoRow('Mano Preferida:',
                record['preferredHand'] ?? 'No especificado'),
            _buildInfoRow(
                'Pie Preferido:', record['preferredFoot'] ?? 'No especificado'),
            _buildInfoRow('Nombre del Examinador:',
                record['examinerName'] ?? 'Desconocido'),
            _buildInfoRow('Título del Examinador:',
                record['examinerTitle'] ?? 'Desconocido'),
            _buildInfoRow('Puntaje Locomotora:',
                record['totalLocomotoraScore']?.toString() ?? 'No disponible'),
            _buildInfoRow('Puntaje Pelota:',
                record['totalPelotaScore']?.toString() ?? 'No disponible'),
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
