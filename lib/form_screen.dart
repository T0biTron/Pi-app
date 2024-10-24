// form_screen.dart

// ignore_for_file: library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_application_1/form0_screen.dart';
import 'package:flutter_application_1/login_screen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required int totalLocomotorScore, required int totalPelotaScore}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _nameController = TextEditingController();
  final _schoolController = TextEditingController();
  final _examinerNameController = TextEditingController();
  final _examinerTitleController = TextEditingController();

  String? _selectedGender;
  int? _selectedDayOfBirth;
  int? _selectedMonthOfBirth;
  int? _selectedYearOfBirth;
  int? _selectedDayOfTest;
  int? _selectedMonthOfTest;
  int? _selectedYearOfTest;
  String? _selectedPreferredHand;
  String? _selectedPreferredFoot;
  String _calculatedAge = '';
  int _ageScore = 0;
  int totalLocomotorScore = 0;
  int totalPelotaScore = 0;

  List<int> _daysInMonth = List.generate(31, (index) => index + 1);

  @override
  void initState() {
    super.initState();
    _updateDaysInMonth(1);
  }

  void _updateDaysInMonth(int month, {bool isBirthDate = true}) {
    int daysInMonth;
    if (month == 2) {
      daysInMonth = 28;
    } else if ([4, 6, 9, 11].contains(month)) {
      daysInMonth = 30;
    } else {
      daysInMonth = 31;
    }

    setState(() {
      _daysInMonth = List.generate(daysInMonth, (index) => index + 1);
      if (isBirthDate) {
        _selectedDayOfBirth = _selectedDayOfBirth?.clamp(1, daysInMonth);
      } else {
        _selectedDayOfTest = _selectedDayOfTest?.clamp(1, daysInMonth);
      }
    });
    _calculateAge();
  }

  void _calculateAge() {
    if (_selectedYearOfBirth != null &&
        _selectedMonthOfBirth != null &&
        _selectedDayOfBirth != null &&
        _selectedYearOfTest != null &&
        _selectedMonthOfTest != null &&
        _selectedDayOfTest != null) {
      DateTime birthDate =
          DateTime(_selectedYearOfBirth!, _selectedMonthOfBirth!, _selectedDayOfBirth!);
      DateTime testDate =
          DateTime(_selectedYearOfTest!, _selectedMonthOfTest!, _selectedDayOfTest!);

      Duration difference = testDate.difference(birthDate);

      int years = difference.inDays ~/ 365;
      int remainingDays = difference.inDays % 365;
      int months = remainingDays ~/ 30;
      int days = remainingDays % 30;

      setState(() {
        _calculatedAge = '$years años, $months meses, $days días';
        _ageScore = (years * 12) + months;
      });
    } else {
      setState(() {
        _calculatedAge = '';
        _ageScore = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Información de Identificación', style: TextStyle(fontSize: 25)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedGender,
              onChanged: (newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
              items: ['Masculino', 'Femenino']
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              decoration: const InputDecoration(
                labelText: 'Género',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Fecha de Nacimiento',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<int>(
                    value: _selectedMonthOfBirth,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedMonthOfBirth = newValue;
                        _selectedDayOfBirth = null;
                        _updateDaysInMonth(newValue!, isBirthDate: true);
                      });
                    },
                    items: List.generate(12, (index) => index + 1)
                        .map((int value) => DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            ))
                        .toList(),
                    decoration: const InputDecoration(
                      labelText: 'Mes',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    value: _selectedDayOfBirth,
                    onChanged: _selectedMonthOfBirth == null
                        ? null
                        : (newValue) {
                            setState(() {
                              _selectedDayOfBirth = newValue;
                              _calculateAge();
                            });
                          },
                    items: _daysInMonth
                        .map((int value) => DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Día',
                      border: OutlineInputBorder(),
                      enabled: _selectedMonthOfBirth != null,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    value: _selectedYearOfBirth,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedYearOfBirth = newValue;
                        _calculateAge();
                      });
                    },
                    items: List.generate(15, (index) => 2010 + index)
                        .map((int value) => DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            ))
                        .toList(),
                    decoration: const InputDecoration(
                      labelText: 'Año',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _schoolController,
              decoration: const InputDecoration(
                labelText: 'Colegio',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedPreferredHand,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedPreferredHand = newValue;
                      });
                    },
                    items: ['Derecha', 'Izquierda', 'No Establecida']
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    decoration: const InputDecoration(
                      labelText: 'Mano preferida',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedPreferredFoot,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedPreferredFoot = newValue;
                      });
                    },
                    items: ['Derecha', 'Izquierda', 'No Establecida']
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    decoration: const InputDecoration(
                      labelText: 'Pie preferido',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _examinerNameController,
              decoration: const InputDecoration(
                labelText: 'Nombre del Examinador',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _examinerTitleController,
              decoration: const InputDecoration(
                labelText: 'Título del Examinador',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 10),
            const Text(
              'Fecha del Test',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<int>(
                    value: _selectedMonthOfTest,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedMonthOfTest = newValue;
                        _selectedDayOfTest = null;
                        _updateDaysInMonth(newValue!, isBirthDate: false);
                      });
                    },
                    items: List.generate(12, (index) => index + 1)
                        .map((int value) => DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            ))
                        .toList(),
                    decoration: const InputDecoration(
                      labelText: 'Mes',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    value: _selectedDayOfTest,
                    onChanged: _selectedMonthOfTest == null
                        ? null
                        : (newValue) {
                            setState(() {
                              _selectedDayOfTest = newValue;
                              _calculateAge();
                            });
                          },
                    items: _daysInMonth
                        .map((int value) => DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Día',
                      border: OutlineInputBorder(),
                      enabled: _selectedMonthOfTest != null,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    value: _selectedYearOfTest,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedYearOfTest = newValue;
                        _calculateAge();
                      });
                    },
                    items: List.generate(5, (index) => 2020 + index)
                        .map((int value) => DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            ))
                        .toList(),
                    decoration: const InputDecoration(
                      labelText: 'Año',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Edad: $_calculatedAge',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Form0Screen(
                      name: _nameController.text,
                      gender: _selectedGender,
                      birthDate: DateTime(
                        _selectedYearOfBirth!,
                        _selectedMonthOfBirth!,
                        _selectedDayOfBirth!,
                      ),
                      school: _schoolController.text,
                      preferredHand: _selectedPreferredHand,
                      preferredFoot: _selectedPreferredFoot,
                      examinerName: _examinerNameController.text,
                      examinerTitle: _examinerTitleController.text,
                      testDate: DateTime(
                        _selectedYearOfTest!,
                        _selectedMonthOfTest!,
                        _selectedDayOfTest!,
                      ),
                      calculatedAge: _calculatedAge,
                      ageScore: _ageScore,
                      totalLocomotoraScore: totalLocomotorScore,
                      totalPelotaScore: totalPelotaScore,
                    ),
                  ),
                );
              },
              child: const Text('Siguiente'),
            ),
          ],
        ),
      ),
    );
  }
}