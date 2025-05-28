// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/section3_screen.dart';
import 'package:flutter_application_1/Screens/section5_screen.dart';

class Section4Screen extends StatelessWidget {
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

  const Section4Screen({
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sección 4', style: TextStyle(fontSize: 25)),
            Text('Términos Descriptivos', style: TextStyle(fontSize: 20)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Section3Screen(
                  name: name,
                  gender: gender,
                  birthDate: birthDate,
                  school: school,
                  preferredHand: preferredHand,
                  preferredFoot: preferredFoot,
                  examinerName: examinerName,
                  examinerTitle: examinerTitle,
                  testDate: testDate,
                  calculatedAge: calculatedAge,
                  totalLocomotoraScore: totalLocomotoraScore,
                  totalPelotaScore: totalPelotaScore,
                  sumEP: sumEP,
                  ageScore: ageScore,
                ),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Center(
                    child: Text(
                      'Puntaje Escalado',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Término Descriptivo',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Índice de Puntaje',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            _buildRow('', 'Deterioro', ''),
            _buildRow('1-3', 'o', '70'),
            _buildRow('', 'retraso', ''),
            const SizedBox(height: 30),
            _buildRow('', 'Borde del', ''),
            _buildRow('4-5', 'deterioro', '70-79'),
            _buildRow('', 'o retraso', ''),
            const SizedBox(height: 30),
            _buildRow('', 'Por debajo', ''),
            _buildRow('6-7', 'del', '80-89'),
            _buildRow('', 'promedio', ''),
            const SizedBox(height: 30),
            _buildRow('8-12', 'Promedio', '90-109'),
            const SizedBox(height: 30),
            _buildRow('', 'Encima', ''),
            _buildRow('13-14', 'del', '110-119'),
            _buildRow('', 'promedio', ''),
            const SizedBox(height: 30),
            _buildRow('15-16', 'Superior', '120-129'),
            const SizedBox(height: 30),
            _buildRow('', 'Con talento', ''),
            _buildRow('17-20', 'o', '>129'),
            _buildRow('', 'muy avanzado', ''),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Section5Screen(
                          name: name,
                          gender: gender,
                          birthDate: birthDate,
                          school: school,
                          preferredHand: preferredHand,
                          preferredFoot: preferredFoot,
                          examinerName: examinerName,
                          examinerTitle: examinerTitle,
                          testDate: testDate,
                          calculatedAge: calculatedAge,
                          totalLocomotoraScore: totalLocomotoraScore,
                          totalPelotaScore: totalPelotaScore,
                          sumEP: sumEP,
                          ageScore: ageScore,
                        ),
                      ),
                    );
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
    );
  }

  Widget _buildRow(String firstLine, String secondLine, String thirdLine) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              firstLine,
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              secondLine,
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              thirdLine,
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
