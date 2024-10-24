// ignore_for_file: library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Screens/section1_screen.dart';
import 'package:flutter_application_1/form1_screen.dart';

class Form2Screen extends StatefulWidget {
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
  final int ageScore;

  const Form2Screen({
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
    required this.ageScore,
  }) : super(key: key);

  @override
  _Form2ScreenState createState() => _Form2ScreenState();
}

class _Form2ScreenState extends State<Form2Screen> {
  final ValueNotifier<int> totalSumNotifier = ValueNotifier<int>(0);
  final Map<String, ValueNotifier<int>> rowSumNotifiers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Formulario de Evaluacion', style: TextStyle(fontSize: 23)),
            Text('Subprueba Habilidad con pelota', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Form1Screen(
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
                  totalLocomotoraScore: totalSumNotifier.value, 
                  totalPelotaScore: totalSumNotifier.value,
                  ageScore: widget.ageScore,
                ),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFormRow(
              'Golpe a dos manos de una pelota estacionaria',
              'Una pelota de plástico de 4 pulgadas (10,2 centímetros), un bate de plástico y un soporte de bateo u otro dispositivo para sostener la pelota estacionaria.',
              'Coloque la pelota en el soporte de bateo al nivel de la cintura del niño. Dígale al niño que golpee la pelota con fuerza, hacia adelante. Apunte hacia adelante. Repita una segunda prueba.',
              [
                '1. La mano preferida del niño agarra el palo por encima de la mano no preferida.',
                '2. La cadera / hombro no preferida del niño mira hacia adelante.',
                '3. La cadera y el hombro giran y rotan durante el swing.',
                '4. Pasos con pie no preferido.',
                '5. Golpea la pelota y la envía en línea recta.'
              ],
            ),
            buildFormRow(
              'Golpe de derecha con una mano de balón rebotado',
              'Una pelota de tenis, una pala de plástico ligero y una pared',
              'Entregue la paleta de plástico y la pelota al niño. Dile al niño que sostenga la bola y la deje caer (para que rebote sobre la altura de la cintura); fuera del rebote, golpear la pelota hacia la pared. Apunte hacia la pared. Repita una segunda prueba.',
              [
                '1. El niño retrocede con la pala cuando la pelota rebota.',
                '2. Pasos con pie no preferido.',
                '3. Golpea la pelota hacia la pared.',
                '4. La paleta sigue hacia el hombro no preferido.'
              ],
            ),
            buildFormRow(
              'Dibbling estacionario con una mano',
              'Una pelota de 8-10 pulgadas (20,3 - 25,4 centímetros) para niños de 3 a 5 años y una superficie plana',
              'Dígale al niño que haga rebotar la pelota con una mano, al menos cuatro veces consecutivas sin mover los pies, y luego deténgala atrapando la pelota. Repita una segunda prueba.',
              [
                '1. Toca la pelota con una mano aproximadamente a la altura de la cintura.',
                '2. Empuja la pelota con la punta de los dedos (sin golpearla)',
                '3. Mantiene el control de la pelota durante al menos cuatro rebotes consecutivos sin mover los pies para recuperar la pelota.'
              ],
            ),
            buildFormRow(
              'Recibir a dos manos',
              'Una bola de plástico de 4 pulgadas (10,2 centímetros), 15 pies (4,6 metros) de espacio libre y cinta adhesiva o un marcador',
              'Marque dos líneas a 15 pies de distancia. El niño se para en una línea y el lanzador se para en la otra línea. Lance la pelota por debajo del niño, apuntando al área del pecho del niño. Dígale al niño que atrape la pelota con las dos manos. Cuente las pruebas solo en las que el lanzamiento esté cerca del pecho del niño. Repita una segunda prueba.',
              [
                '1. Las manos del niño se colocan frente al cuerpo con los codos flexionados.',
                '2. Los brazos se extienden, alcanzando la pelota cuando llega.',
                '3. La pelota es atrapada solo por las manos.',
              ],
            ),
            buildFormRow(
              'Patear una pelota estacionaria',
              'Un balón de plástico, patio de recreo o fútbol de 8-10 pulgadas (20,3 - 25,4 centímetros); cinta o un marcador; una pared; y espacio libre para patear',
              'Marque una línea a unos 20 pies (6,1 metros) de la pared y una segunda línea a 8 pies (2,4 metros) más allá de la primera línea. Coloque la pelota en la primera línea más cercana a la pared. Dígale al niño que corra y patee la pelota con fuerza hacia la pared. Repita una segunda prueba.',
              [
                '1. Aproximación rápida y continua a la pelota.',
                '2. El niño da un paso o salto alargado justo antes del contacto con la pelota.',
                '3. Pie que no patea colocado cerca de la pelota.',
                '4. Patea la pelota con elempeine o el pie interior o preferido (no los dedos de los pies).'
              ],
            ),
            buildFormRow(
              'Lanzamiento por encima',
              'Una pelota de tenis, una pared y 20 pies (6,1 metros) de espacio libre.',
              'Coloque una cinta adhesiva en el piso a 20 pies de la pared. Haga que el niño se pare detrás de la línea de la cinta, mirando hacia la pared. Dígale al niño que tire la pelota con fuerza contra la pared. Repita una segunda prueba.',
              [
                '1. La secuencia se inicia con un movimiento descendente de la mano y el brazo.',
                '2. Gira la cadera y el hombro hasta un punto donde el lado que no arroja mira hacia la pared.',
                '3. Pasos con el pie opuesto a la mano que tira hacia la pared.',
                '4. La mano que lanza sigue a través del lanzamiento de la pelota, cruza el cuerpo hacia la cadera del lado que no lanza.'
              ],
            ),
            buildFormRow(
              'Lanzamiento bajo la mano',
              'Una pelota de tenis, cinta adhesiva, una pared y 15 pies (4,6 metros) de espacio.',
  	          'Coloque una cinta adhesiva a 15 pies de la pared. Haga que el niño se pare detrás de la línea de la cinta, mirando hacia la pared. Dígale al niño que lance la pelota y golpee la pared. Repite una segunda prueba.',              [
                '1. La mano preferida se balancea hacia abajo y hacia atrás, alcanzando detrás del tronco.',
                '2. Da un paso adelante con el pie opuesto a la mano que lanza.',
                '3. La pelota es lanzada hacia adelante, golpeando la pared sin rebotar.',
                '4. La mano sigue después de soltar la pelota al menos hasta el nivel del pecho.'
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  ValueListenableBuilder<int>(
                    valueListenable: totalSumNotifier,
                    builder: (context, value, child) {
                      return Text(
                        'Puntaje Total de Habilidades con pelota: $value',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Section1Screen(
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
                            totalPelotaScore: totalSumNotifier.value,
                            ageScore: widget.ageScore,
                          ),
                        ),
                      );
                    },
                    child: const Text('Finalizar Test'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFormRow(String title,String materials, String orientacion, List<String> criteria) {
    final rowKey = title;
    final ValueNotifier<int> totalSumController = ValueNotifier<int>(0);
    rowSumNotifiers[rowKey] = totalSumController;
    List<TextEditingController> textControllers = [];

    void updateSum() {
      int rowSum = 0;
      for (var controller in textControllers) {
        rowSum += int.tryParse(controller.text) ?? 0;
      }
      totalSumController.value = rowSum;

      int totalSum = rowSumNotifiers.values.map((e) => e.value).reduce((a, b) => a + b);
      totalSumNotifier.value = totalSum;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Materiales: ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: materials,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Orientaciones: ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: orientacion,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        SizedBox(height: 7),
        Text(
          'Criterios de funcionamiento:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        for (var i = 0; i < criteria.length; i++)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    criteria[i],
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      for (var j = 0; j < 2; j++)
                        Expanded(
                          child: Column(
                            children: [
                              if (i == 0)
                                Text(
                                  j == 0 ? 'Prueba 1' : 'Prueba 2',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              TextField(
                                controller: (() {
                                  final controller = TextEditingController();
                                  textControllers.add(controller);
                                  return controller;
                                })(),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[01]')),
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                                ),
                                onChanged: (_) => updateSum(),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Puntaje Habilidad: ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ValueListenableBuilder<int>(
              valueListenable: totalSumController,
              builder: (context, value, child) {
                return Text(
                  value.toString(),
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}