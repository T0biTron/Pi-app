// ignore_for_file: library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/form0_screen.dart';
import 'package:flutter_application_1/form2_screen.dart';

class Form1Screen extends StatefulWidget {
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

  const Form1Screen({
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
    required int totalLocomotoraScore,
    required totalPelotaScore,
    required this.ageScore,
  }) : super(key: key);

  @override
  _Form1ScreenState createState() => _Form1ScreenState();
}

class _Form1ScreenState extends State<Form1Screen> {
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
            Text('Subprueba Locomotora',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Form0Screen(
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
              'Correr',
              '60 pies (18,3 metros)',
              'Área libre para correr, y conos o marcadores para delimitar.',
              'Coloque dos conos a 50 pies (15,2 metros) de distancia. Asegúrese de que hay al menos 8-10 pies (2,4 a 3,1 metros) de espacio más allá del cono para una distancia para una parada segura. Dígale al niño que corra rápido de un cono al otro cono cuando diga "vamos". Repita una segunda prueba.',
              [
                '1. Los brazos se mueven en oposición a las piernas con los codos doblados.',
                '2. Breve periodo donde ambos pies están fuera de la superficie.',
                '3. Colocación estrecha del pie que aterriza con el talón o los dedos de los pies (no con el pie plano)',
                '4. La pierna sin soporte se dobla unos 90 grados para que el pie esté cerca de las nalgas.'
              ],
            ),
            buildFormRow(
              'Galope',
              '25 pies (7,6 metros)',
              'Espacio libre y dos conos o marcadores',
              'Coloque dos conos a 25 pies (7,62 metros) de distancia. Dígale al niño que galope de un cono al otro y que se detenga. Repite una segunda prueba.',
              [
                '1. Brazos flexionados y balanceándose hacia adelante',
                '2. Un paso adelante con el pie adelantado, seguido con el pie trasero aterrizando al lado o un poco detrás del pie principal (no delante del pie delantero).',
                '3. Breve período en el que ambos piessalen de la superficie.',
                '4. Mantiene un patrón rítmico durante cuatro galopeos consecutivos.'
              ],
            ),
            buildFormRow(
              'Salto a un pie',
              'Un mínimo de 30 pies (9,1 metros)',
              'Espacio claro y dos conos o marcadores.',
              'Coloque dos conos a 15 pies de distancia. Dígale al niño que salte cuatro veces con su pie preferido (establecido antes de la prueba). Repita una segunda prueba.',
              [
                '1. La pierna que no salta se balancea hacia adelante en forma pendular para producir fuerza.',
                '2. El pie de la pierna que no salta queda detrás de la pierna que salta (no se cruza por delante)',
                '3. Los brazos se flexionan y se balancean hacia adelante para producir fuerza.',
                '4. Salta cuatro veces consecutivas con el pie preferido antes de detenerse.'
              ],
            ),
            buildFormRow(
              'Salto caballo',
              'Un mínimo de 60 pies (18,3 metros)',
              'Dos conos o marcadores.',
              'Coloque dos conos a 30 pies de distancia. Marque dos líneas al menos a 30 pies de distancia con conos / marcadores. Dígale al niño que salte de un cono al otro. Repita una segunda prueba.',
              [
                '1. Un paso adelante seguido de un salto en el mismo pie.',
                '2. Los brazos se flexionan y se mueven en oposición a las piernas para producir fuerza.',
                '3. Completa cuatro saltos continuos con alternancia rítmica.'
              ],
            ),
            buildFormRow(
              'Salto Horizontal',
              'Un mínimo de 10 pies (3,1 metros)',
              'Espacio libre y conicidad o marcadores.',
              'Marque una línea de partida en el piso, tapete o alfombra. Coloque al niño detrás de la línea. Dile al niño que salte lejos. Repita una segunda prueba.',
              [
                '1. Antes del despegue, ambas rodillas están flexionadas y los brazos extendidos detrás de la espalda.',
                '2. Los brazos se extienden con fuerza hacia adelante y hacia arriba, llegando por encima de la cabeza.',
                '3. Ambos pies salen del piso juntos y aterrizan juntos.',
                '4. Ambos brazos son forzados hacia abajo durante el aterrizaje.'
              ],
            ),
            buildFormRow(
              'Deslizar',
              'Un mínimo de 25 pies (7,6 metros)',
              'Espacio libre, una linea recta y dos conos o marcadores.',
              'Coloque dos conos a 25 pies de distancia en línea recta. Dígale al niño que se deslice de un cono al otro. Deje que el niño decida en qué dirección deslizarse primero. Pídale al niño que vuelva al punto de partida. Repita una segunda prueba.',
              [
                '1. El cuerpo se gira hacia los lados para que los hombros permanezcan alineados con la línea en el suelo (puntúe en el lado preferido solamente).',
                '2. Un paso de lado con el pie adelantado seguido de un deslizamiento con el pie de arrastre donde ambos pies salen de la superficie brevemente (Puntuación en el lado preferido solamente).',
                '3. Cuatro deslizamientos continuos por el lado preferido.',
                '4.  Cuatro deslizamientos continuos por el lado no-preferido.'
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
                        'Puntuación Total Locomotora: $value',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
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
                            totalLocomotoraScore: totalSumNotifier.value,
                            totalPelotaScore: totalSumNotifier.value,
                            ageScore: widget.ageScore,
                          ),
                        ),
                      );
                    },
                    child: const Text('Siguiente'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFormRow(String title, String distancia, String materials,
      String orientacion, List<String> criteria) {
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

      int totalSum =
          rowSumNotifiers.values.map((e) => e.value).reduce((a, b) => a + b);
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
                text: 'Distancia: ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: distancia,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ],
          ),
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
          'Criterios de funcionamiento',
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
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
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
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
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
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[01]')),
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8),
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    updateSum();
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
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
