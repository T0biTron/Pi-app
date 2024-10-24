// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/section4_screen.dart';
import 'package:flutter_application_1/login_screen.dart';

class Section5Screen extends StatelessWidget {
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

  const Section5Screen({
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
            Text('Sección 5', style: TextStyle(fontSize: 25)),
            Text('Administración y directrices de puntaje ', style: TextStyle(fontSize: 20)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Section4Screen(
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
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '* Las instrucciones para todos los elementos de prueba requieren que primero le dé al niño una buena demostración de la habilidad, que incluye todos los criterios de desempeño. Luego, dele al niño una prueba de práctica, seguida de dos pruebas que califique. Si no está seguro de si el niño realizó un criterio de desempeño correctamente, administre otra prueba, mire solo ese criterio de desempeño y califíquelo.',
            ),
            SizedBox(height: 10,),
            Text(
              '* Califique cada criterio de desempeño como:\n- 1 = funciona correctamente\n- 0 = no funciona correctamente',
            ),
            SizedBox(height: 10,),
            Text(
              '* Los puntajes de los criterios de desempeño se calculan sumando los puntajes en el ensayo 1 y el ensayo 2 para cada criterio de desempeño.',
            ),
            SizedBox(height: 10,),
            Text(
              '* Los puntajes de habilidad se calculan sumando todos los puntajes de criterios de rendimiento para cada habilidad.',
            ),
            SizedBox(height: 10,),
            Text(
              '* El puntaje bruto total locomotor se calcula sumando los 6 puntajes de habilidad locomotora.',
            ),
            SizedBox(height: 10,),
            Text(
              '* El puntaje bruto total de habilidades de pelota se calcula sumando los 7 puntajes de habilidades de pelota.',
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                elevation: 18,
                shadowColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              ),
              child: const Text(
                'Finalizar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}