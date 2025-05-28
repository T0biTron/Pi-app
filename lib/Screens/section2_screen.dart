// ignore_for_file: library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/section1_screen.dart';
import 'package:flutter_application_1/Screens/section3_screen.dart';
import 'package:flutter_application_1/api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Section2Screen extends StatefulWidget {
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
  final int idUser;

  const Section2Screen(
      {Key? key,
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
      this.idUser = 0}) // Make it optional with default value
      : super(key: key);

  @override
  _Section2ScreenState createState() => _Section2ScreenState();
}

class _Section2ScreenState extends State<Section2Screen> {
  late TextEditingController _locomotoraPBController;
  late TextEditingController _locomotoraEQController;
  late TextEditingController _locomotoraRPController;
  late TextEditingController _locomotoraEPController;
  late TextEditingController _locomotoraIC90Controller;
  late TextEditingController _locomotoraIC95Controller;
  late TextEditingController _locomotoraTDController;
  late TextEditingController _pelotaPBController;
  late TextEditingController _pelotaEQController;
  late TextEditingController _pelotaRPController;
  late TextEditingController _pelotaEPController;
  late TextEditingController _pelotaIC90Controller;
  late TextEditingController _pelotaIC95Controller;
  late TextEditingController _pelotaTDController;
  late TextEditingController _sumEPController;
  late TextEditingController _difEPController;
  late TextEditingController _estadoController;

  String getLocomotoraEQ(int puntajeBruto) {
    if (puntajeBruto < 15) return "<3-0";
    if (puntajeBruto == 15) return "3-0";
    if (puntajeBruto == 16) return "3-3";
    if (puntajeBruto == 17) return "3-6";
    if (puntajeBruto == 18) return "3-9";
    if (puntajeBruto >= 19 && puntajeBruto <= 21) return "4-0";
    if (puntajeBruto >= 22 && puntajeBruto <= 23) return "4-3";
    if (puntajeBruto == 24) return "4-6";
    if (puntajeBruto == 25) return "5-0";
    if (puntajeBruto == 26) return "5-3";
    if (puntajeBruto >= 27 && puntajeBruto <= 29) return "5-6";
    if (puntajeBruto >= 30 && puntajeBruto <= 31) return "5-9";
    if (puntajeBruto == 32) return "6-0";
    if (puntajeBruto == 33) return "6-3";
    if (puntajeBruto == 34) return "6-6";
    if (puntajeBruto == 35) return "6-9";
    if (puntajeBruto == 36) return "8-0";
    if (puntajeBruto == 37) return "9-0";
    if (puntajeBruto == 38) return "10-6";
    if (puntajeBruto > 38) return ">10-11";
    return "";
  }

  String getLocomotoraRP(int puntajeBruto, int ageScore) {
    if (ageScore >= 36 && ageScore <= 41) {
      // 3-0 a 3-5
      if (puntajeBruto == 0) return "1";
      if (puntajeBruto >= 1 && puntajeBruto <= 2) return "2";
      if (puntajeBruto >= 3 && puntajeBruto <= 4) return "5";
      if (puntajeBruto >= 5 && puntajeBruto <= 6) return "9";
      if (puntajeBruto >= 7 && puntajeBruto <= 9) return "16";
      if (puntajeBruto >= 10 && puntajeBruto <= 11) return "25";
      if (puntajeBruto >= 12 && puntajeBruto <= 14) return "37";
      if (puntajeBruto >= 15 && puntajeBruto <= 16) return "50";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "63";
      if (puntajeBruto >= 19 && puntajeBruto <= 23) return "75";
      if (puntajeBruto == 24) return "84";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "91";
      if (puntajeBruto >= 27 && puntajeBruto <= 31) return "95";
      if (puntajeBruto >= 32 && puntajeBruto <= 36) return "98";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "99";
      if (puntajeBruto >= 39 && puntajeBruto <= 46) return ">99";
    } else if (ageScore >= 42 && ageScore <= 47) {
      // 3-6 a 3-11
      if (puntajeBruto >= 0 && puntajeBruto <= 1) return "1";
      if (puntajeBruto >= 2 && puntajeBruto <= 3) return "2";
      if (puntajeBruto >= 4 && puntajeBruto <= 6) return "5";
      if (puntajeBruto >= 7 && puntajeBruto <= 9) return "9";
      if (puntajeBruto >= 10 && puntajeBruto <= 11) return "16";
      if (puntajeBruto >= 12 && puntajeBruto <= 14) return "25";
      if (puntajeBruto >= 15 && puntajeBruto <= 16) return "37";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "50";
      if (puntajeBruto >= 19 && puntajeBruto <= 23) return "63";
      if (puntajeBruto == 24) return "75";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "84";
      if (puntajeBruto >= 27 && puntajeBruto <= 31) return "91";
      if (puntajeBruto >= 32 && puntajeBruto <= 36) return "95";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "98";
      if (puntajeBruto >= 39 && puntajeBruto <= 41) return "99";
      if (puntajeBruto >= 42 && puntajeBruto <= 46) return ">99";
    } else if (ageScore >= 48 && ageScore <= 53) {
      // 4-0 a 4-5
      if (puntajeBruto == 0) return "<1";
      if (puntajeBruto >= 1 && puntajeBruto <= 3) return "1";
      if (puntajeBruto >= 4 && puntajeBruto <= 6) return "2";
      if (puntajeBruto >= 7 && puntajeBruto <= 8) return "5";
      if (puntajeBruto >= 9 && puntajeBruto <= 11) return "9";
      if (puntajeBruto >= 12 && puntajeBruto <= 14) return "16";
      if (puntajeBruto >= 15 && puntajeBruto <= 16) return "25";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "37";
      if (puntajeBruto >= 19 && puntajeBruto <= 23) return "50";
      if (puntajeBruto == 24) return "63";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "75";
      if (puntajeBruto >= 27 && puntajeBruto <= 31) return "84";
      if (puntajeBruto >= 32 && puntajeBruto <= 36) return "91";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "95";
      if (puntajeBruto >= 39 && puntajeBruto <= 41) return "98";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "99";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return ">99";
    } else if (ageScore >= 54 && ageScore <= 59) {
      // 4-6 a 4-11
      if (puntajeBruto >= 0 && puntajeBruto <= 2) return "<1";
      if (puntajeBruto >= 3 && puntajeBruto <= 5) return "1";
      if (puntajeBruto >= 6 && puntajeBruto <= 8) return "2";
      if (puntajeBruto >= 9 && puntajeBruto <= 11) return "5";
      if (puntajeBruto >= 12 && puntajeBruto <= 14) return "9";
      if (puntajeBruto >= 15 && puntajeBruto <= 16) return "16";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "25";
      if (puntajeBruto >= 19 && puntajeBruto <= 23) return "37";
      if (puntajeBruto == 24) return "50";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "63";
      if (puntajeBruto >= 27 && puntajeBruto <= 31) return "75";
      if (puntajeBruto >= 32 && puntajeBruto <= 36) return "84";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "91";
      if (puntajeBruto >= 39 && puntajeBruto <= 41) return "95";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "98";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "99";
    } else if (ageScore >= 60 && ageScore <= 65) {
      // 5-0 a 5-5
      if (puntajeBruto >= 0 && puntajeBruto <= 4) return "<1";
      if (puntajeBruto >= 5 && puntajeBruto <= 7) return "1";
      if (puntajeBruto >= 8 && puntajeBruto <= 11) return "2";
      if (puntajeBruto >= 12 && puntajeBruto <= 14) return "5";
      if (puntajeBruto >= 15 && puntajeBruto <= 16) return "9";
      if (puntajeBruto >= 17 && puntajeBruto <= 16) return "16";
      if (puntajeBruto >= 19 && puntajeBruto <= 23) return "25";
      if (puntajeBruto == 24) return "37";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "50";
      if (puntajeBruto >= 27 && puntajeBruto <= 31) return "63";
      if (puntajeBruto >= 32 && puntajeBruto <= 36) return "75";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "84";
      if (puntajeBruto >= 39 && puntajeBruto <= 41) return "91";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "95";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "98";
    } else if (ageScore >= 66 && ageScore <= 71) {
      // 5-6 a 5-11
      if (puntajeBruto >= 0 && puntajeBruto <= 7) return "<1";
      if (puntajeBruto >= 8 && puntajeBruto <= 10) return "1";
      if (puntajeBruto >= 11 && puntajeBruto <= 14) return "2";
      if (puntajeBruto >= 15 && puntajeBruto <= 16) return "5";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "9";
      if (puntajeBruto >= 19 && puntajeBruto <= 23) return "16";
      if (puntajeBruto == 24) return "25";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "37";
      if (puntajeBruto >= 27 && puntajeBruto <= 31) return "50";
      if (puntajeBruto >= 32 && puntajeBruto <= 36) return "63";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "75";
      if (puntajeBruto >= 39 && puntajeBruto <= 41) return "84";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "91";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "95";
    } else if (ageScore >= 72 && ageScore <= 77) {
      // 6-0 a 6-5
      if (puntajeBruto >= 0 && puntajeBruto <= 10) return "<1";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "1";
      if (puntajeBruto >= 14 && puntajeBruto <= 16) return "2";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "5";
      if (puntajeBruto >= 19 && puntajeBruto <= 22) return "9";
      if (puntajeBruto >= 23 && puntajeBruto <= 24) return "16";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "25";
      if (puntajeBruto >= 27 && puntajeBruto <= 30) return "37";
      if (puntajeBruto >= 31 && puntajeBruto <= 33) return "50";
      if (puntajeBruto >= 34 && puntajeBruto <= 36) return "63";
      if (puntajeBruto >= 37 && puntajeBruto <= 39) return "75";
      if (puntajeBruto >= 40 && puntajeBruto <= 42) return "84";
      if (puntajeBruto >= 43 && puntajeBruto <= 45) return "91";
      if (puntajeBruto >= 46) return "95";
    } else if (ageScore >= 78 && ageScore <= 83) {
      // 6-6 a 6-11
      if (puntajeBruto >= 0 && puntajeBruto <= 13) return "<1";
      if (puntajeBruto >= 14 && puntajeBruto <= 16) return "1";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "2";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "5";
      if (puntajeBruto >= 22 && puntajeBruto <= 24) return "9";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "16";
      if (puntajeBruto >= 27 && puntajeBruto <= 29) return "25";
      if (puntajeBruto >= 30 && puntajeBruto <= 32) return "37";
      if (puntajeBruto >= 33 && puntajeBruto <= 35) return "50";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "63";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "75";
      if (puntajeBruto >= 41 && puntajeBruto <= 43) return "84";
      if (puntajeBruto >= 44 && puntajeBruto <= 45) return "91";
      if (puntajeBruto >= 46) return "95";
    } else if (ageScore >= 84 && ageScore <= 89) {
      // 7-0 a 7-5
      if (puntajeBruto >= 0 && puntajeBruto <= 16) return "<1";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "1";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "2";
      if (puntajeBruto >= 22 && puntajeBruto <= 23) return "5";
      if (puntajeBruto >= 24 && puntajeBruto <= 26) return "9";
      if (puntajeBruto >= 27 && puntajeBruto <= 28) return "16";
      if (puntajeBruto >= 29 && puntajeBruto <= 31) return "25";
      if (puntajeBruto >= 32 && puntajeBruto <= 33) return "37";
      if (puntajeBruto >= 34 && puntajeBruto <= 36) return "50";
      if (puntajeBruto >= 37 && puntajeBruto <= 39) return "63";
      if (puntajeBruto >= 40 && puntajeBruto <= 41) return "75";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "84";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "91";
    } else if (ageScore >= 90 && ageScore <= 95) {
      // 7-6 a 7-11
      if (puntajeBruto >= 0 && puntajeBruto <= 18) return "<1";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "1";
      if (puntajeBruto >= 22 && puntajeBruto <= 23) return "2";
      if (puntajeBruto >= 24 && puntajeBruto <= 25) return "5";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "9";
      if (puntajeBruto >= 29 && puntajeBruto <= 30) return "16";
      if (puntajeBruto >= 31 && puntajeBruto <= 32) return "25";
      if (puntajeBruto >= 33 && puntajeBruto <= 35) return "37";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "50";
      if (puntajeBruto >= 38 && puntajeBruto <= 39) return "63";
      if (puntajeBruto >= 40 && puntajeBruto <= 42) return "75";
      if (puntajeBruto >= 43 && puntajeBruto <= 44) return "84";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "91";
    } else if (ageScore >= 96 && ageScore <= 107) {
      // 8-0 a 8-11
      if (puntajeBruto >= 0 && puntajeBruto <= 20) return "<1";
      if (puntajeBruto >= 21 && puntajeBruto <= 22) return "1";
      if (puntajeBruto >= 23 && puntajeBruto <= 24) return "2";
      if (puntajeBruto >= 25 && puntajeBruto <= 27) return "5";
      if (puntajeBruto >= 28 && puntajeBruto <= 29) return "9";
      if (puntajeBruto >= 30 && puntajeBruto <= 31) return "16";
      if (puntajeBruto >= 32 && puntajeBruto <= 33) return "25";
      if (puntajeBruto >= 34 && puntajeBruto <= 35) return "37";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "50";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "63";
      if (puntajeBruto >= 41 && puntajeBruto <= 42) return "75";
      if (puntajeBruto >= 43 && puntajeBruto <= 44) return "84";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "91";
    } else if (ageScore >= 108 && ageScore <= 131) {
      // 9-0 a 10-11
      if (puntajeBruto >= 0 && puntajeBruto <= 21) return "<1";
      if (puntajeBruto >= 22 && puntajeBruto <= 23) return "1";
      if (puntajeBruto >= 24 && puntajeBruto <= 25) return "2";
      if (puntajeBruto >= 26 && puntajeBruto <= 27) return "5";
      if (puntajeBruto >= 28 && puntajeBruto <= 30) return "9";
      if (puntajeBruto >= 31 && puntajeBruto <= 32) return "16";
      if (puntajeBruto >= 33 && puntajeBruto <= 34) return "25";
      if (puntajeBruto >= 35 && puntajeBruto <= 36) return "37";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "50";
      if (puntajeBruto >= 39 && puntajeBruto <= 40) return "63";
      if (puntajeBruto >= 41 && puntajeBruto <= 42) return "75";
      if (puntajeBruto >= 43 && puntajeBruto <= 45) return "84";
      if (puntajeBruto >= 46) return "91";
    }
    return "";
  }

  String getLocomotoraEP(int puntajeBruto, int ageScore) {
    if (ageScore >= 36 && ageScore <= 41) {
      // 3-0 a 3-5
      if (puntajeBruto == 0) return "3";
      if (puntajeBruto >= 1 && puntajeBruto <= 2) return "4";
      if (puntajeBruto >= 3 && puntajeBruto <= 4) return "5";
      if (puntajeBruto >= 5 && puntajeBruto <= 6) return "6";
      if (puntajeBruto >= 7 && puntajeBruto <= 9) return "7";
      if (puntajeBruto >= 10 && puntajeBruto <= 11) return "8";
      if (puntajeBruto >= 12 && puntajeBruto <= 14) return "9";
      if (puntajeBruto >= 15 && puntajeBruto <= 16) return "10";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "11";
      if (puntajeBruto >= 19 && puntajeBruto <= 23) return "12";
      if (puntajeBruto == 24) return "13";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "14";
      if (puntajeBruto >= 27 && puntajeBruto <= 31) return "15";
      if (puntajeBruto >= 32 && puntajeBruto <= 36) return "16";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "17";
      if (puntajeBruto >= 39 && puntajeBruto <= 41) return "18";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "19";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "20";
    } else if (ageScore >= 42 && ageScore <= 47) {
      // 3-5 a 3-11
      if (puntajeBruto >= 0 && puntajeBruto <= 1) return "3";
      if (puntajeBruto >= 2 && puntajeBruto <= 3) return "4";
      if (puntajeBruto >= 4 && puntajeBruto <= 6) return "5";
      if (puntajeBruto >= 7 && puntajeBruto <= 9) return "6";
      if (puntajeBruto >= 10 && puntajeBruto <= 11) return "7";
      if (puntajeBruto >= 12 && puntajeBruto <= 14) return "8";
      if (puntajeBruto >= 15 && puntajeBruto <= 16) return "9";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "10";
      if (puntajeBruto >= 19 && puntajeBruto <= 23) return "11";
      if (puntajeBruto == 24) return "12";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "13";
      if (puntajeBruto >= 27 && puntajeBruto <= 31) return "14";
      if (puntajeBruto >= 32 && puntajeBruto <= 36) return "15";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "16";
      if (puntajeBruto >= 39 && puntajeBruto <= 41) return "17";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "18";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "19";
    } else if (ageScore >= 48 && ageScore <= 53) {
      // 4-0 a 4-5
      if (puntajeBruto == 0) return "2";
      if (puntajeBruto >= 1 && puntajeBruto <= 3) return "3";
      if (puntajeBruto >= 4 && puntajeBruto <= 6) return "4";
      if (puntajeBruto >= 7 && puntajeBruto <= 8) return "5";
      if (puntajeBruto >= 9 && puntajeBruto <= 11) return "6";
      if (puntajeBruto >= 12 && puntajeBruto <= 14) return "7";
      if (puntajeBruto >= 15 && puntajeBruto <= 16) return "8";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "9";
      if (puntajeBruto >= 19 && puntajeBruto <= 23) return "10";
      if (puntajeBruto == 24) return "11";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "12";
      if (puntajeBruto >= 27 && puntajeBruto <= 31) return "13";
      if (puntajeBruto >= 32 && puntajeBruto <= 36) return "14";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "15";
      if (puntajeBruto >= 39 && puntajeBruto <= 41) return "16";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "17";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "18";
    } else if (ageScore >= 54 && ageScore <= 59) {
      // 4-6 a 4-11
      if (puntajeBruto >= 0 && puntajeBruto <= 2) return "2";
      if (puntajeBruto >= 3 && puntajeBruto <= 5) return "3";
      if (puntajeBruto >= 6 && puntajeBruto <= 8) return "4";
      if (puntajeBruto >= 9 && puntajeBruto <= 11) return "5";
      if (puntajeBruto >= 12 && puntajeBruto <= 14) return "6";
      if (puntajeBruto >= 15 && puntajeBruto <= 16) return "7";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "8";
      if (puntajeBruto >= 19 && puntajeBruto <= 23) return "9";
      if (puntajeBruto == 24) return "10";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "11";
      if (puntajeBruto >= 27 && puntajeBruto <= 31) return "12";
      if (puntajeBruto >= 32 && puntajeBruto <= 36) return "13";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "14";
      if (puntajeBruto >= 39 && puntajeBruto <= 41) return "15";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "16";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "17";
    } else if (ageScore >= 60 && ageScore <= 65) {
      // 5-0 a 5-5
      if (puntajeBruto >= 0 && puntajeBruto <= 1) return "1";
      if (puntajeBruto >= 2 && puntajeBruto <= 4) return "2";
      if (puntajeBruto >= 5 && puntajeBruto <= 7) return "3";
      if (puntajeBruto >= 8 && puntajeBruto <= 11) return "4";
      if (puntajeBruto >= 12 && puntajeBruto <= 14) return "5";
      if (puntajeBruto >= 15 && puntajeBruto <= 16) return "6";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "7";
      if (puntajeBruto >= 19 && puntajeBruto <= 23) return "8";
      if (puntajeBruto == 24) return "9";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "10";
      if (puntajeBruto >= 27 && puntajeBruto <= 31) return "11";
      if (puntajeBruto >= 32 && puntajeBruto <= 36) return "12";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "13";
      if (puntajeBruto >= 39 && puntajeBruto <= 41) return "14";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "15";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "16";
    } else if (ageScore >= 66 && ageScore <= 71) {
      // 5-6 a 5-11
      if (puntajeBruto >= 0 && puntajeBruto <= 4) return "1";
      if (puntajeBruto >= 5 && puntajeBruto <= 7) return "2";
      if (puntajeBruto >= 8 && puntajeBruto <= 10) return "3";
      if (puntajeBruto >= 11 && puntajeBruto <= 14) return "4";
      if (puntajeBruto >= 15 && puntajeBruto <= 16) return "5";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "6";
      if (puntajeBruto >= 19 && puntajeBruto <= 23) return "7";
      if (puntajeBruto == 24) return "8";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "9";
      if (puntajeBruto >= 27 && puntajeBruto <= 31) return "10";
      if (puntajeBruto >= 32 && puntajeBruto <= 36) return "11";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "12";
      if (puntajeBruto >= 39 && puntajeBruto <= 41) return "13";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "14";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "15";
    } else if (ageScore >= 72 && ageScore <= 77) {
      // 6-0 a 6-5
      if (puntajeBruto >= 0 && puntajeBruto <= 10) return "1";
      if (puntajeBruto >= 8 && puntajeBruto <= 10) return "2";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "3";
      if (puntajeBruto >= 14 && puntajeBruto <= 16) return "4";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "5";
      if (puntajeBruto >= 19 && puntajeBruto <= 22) return "6";
      if (puntajeBruto >= 23 && puntajeBruto <= 24) return "7";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "8";
      if (puntajeBruto >= 27 && puntajeBruto <= 30) return "9";
      if (puntajeBruto >= 31 && puntajeBruto <= 33) return "10";
      if (puntajeBruto >= 34 && puntajeBruto <= 36) return "11";
      if (puntajeBruto >= 37 && puntajeBruto <= 39) return "12";
      if (puntajeBruto >= 40 && puntajeBruto <= 42) return "13";
      if (puntajeBruto >= 43 && puntajeBruto <= 45) return "14";
      if (puntajeBruto >= 46) return "15";
    } else if (ageScore >= 78 && ageScore <= 83) {
      // 6-6 a 6-11
      if (puntajeBruto >= 0 && puntajeBruto <= 10) return "1";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "2";
      if (puntajeBruto >= 14 && puntajeBruto <= 16) return "3";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "4";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "5";
      if (puntajeBruto >= 22 && puntajeBruto <= 24) return "6";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "7";
      if (puntajeBruto >= 27 && puntajeBruto <= 29) return "8";
      if (puntajeBruto >= 30 && puntajeBruto <= 32) return "9";
      if (puntajeBruto >= 33 && puntajeBruto <= 35) return "10";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "11";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "12";
      if (puntajeBruto >= 41 && puntajeBruto <= 43) return "13";
      if (puntajeBruto >= 44 && puntajeBruto <= 45) return "14";
      if (puntajeBruto >= 46) return "15";
    } else if (ageScore >= 84 && ageScore <= 89) {
      // 7-0 a 7-5
      if (puntajeBruto >= 0 && puntajeBruto <= 13) return "1";
      if (puntajeBruto >= 14 && puntajeBruto <= 16) return "2";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "3";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "4";
      if (puntajeBruto >= 22 && puntajeBruto <= 23) return "5";
      if (puntajeBruto >= 24 && puntajeBruto <= 26) return "6";
      if (puntajeBruto >= 27 && puntajeBruto <= 28) return "7";
      if (puntajeBruto >= 29 && puntajeBruto <= 31) return "8";
      if (puntajeBruto >= 32 && puntajeBruto <= 33) return "9";
      if (puntajeBruto >= 34 && puntajeBruto <= 36) return "10";
      if (puntajeBruto >= 37 && puntajeBruto <= 39) return "11";
      if (puntajeBruto >= 40 && puntajeBruto <= 41) return "12";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "13";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "14";
    } else if (ageScore >= 90 && ageScore <= 95) {
      // 7-6 a 7-11
      if (puntajeBruto >= 0 && puntajeBruto <= 16) return "1";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "2";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "3";
      if (puntajeBruto >= 22 && puntajeBruto <= 23) return "4";
      if (puntajeBruto >= 24 && puntajeBruto <= 25) return "5";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "6";
      if (puntajeBruto >= 29 && puntajeBruto <= 30) return "7";
      if (puntajeBruto >= 31 && puntajeBruto <= 32) return "8";
      if (puntajeBruto >= 33 && puntajeBruto <= 35) return "9";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "10";
      if (puntajeBruto >= 38 && puntajeBruto <= 39) return "11";
      if (puntajeBruto >= 40 && puntajeBruto <= 42) return "12";
      if (puntajeBruto >= 43 && puntajeBruto <= 44) return "13";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "14";
    } else if (ageScore >= 96 && ageScore <= 107) {
      // 8-0 a 8-11
      if (puntajeBruto >= 0 && puntajeBruto <= 18) return "1";
      if (puntajeBruto >= 19 && puntajeBruto <= 20) return "2";
      if (puntajeBruto >= 21 && puntajeBruto <= 22) return "3";
      if (puntajeBruto >= 23 && puntajeBruto <= 24) return "4";
      if (puntajeBruto >= 25 && puntajeBruto <= 27) return "5";
      if (puntajeBruto >= 28 && puntajeBruto <= 29) return "9";
      if (puntajeBruto >= 30 && puntajeBruto <= 31) return "16";
      if (puntajeBruto >= 32 && puntajeBruto <= 33) return "25";
      if (puntajeBruto >= 34 && puntajeBruto <= 35) return "37";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "50";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "63";
      if (puntajeBruto >= 41 && puntajeBruto <= 42) return "75";
      if (puntajeBruto >= 43 && puntajeBruto <= 44) return "84";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "91";
    } else if (ageScore >= 108 && ageScore <= 131) {
      // 9-0 a 10-11
      if (puntajeBruto >= 0 && puntajeBruto <= 19) return "1";
      if (puntajeBruto >= 20 && puntajeBruto <= 21) return "<2";
      if (puntajeBruto >= 22 && puntajeBruto <= 23) return "3";
      if (puntajeBruto >= 24 && puntajeBruto <= 25) return "4";
      if (puntajeBruto >= 26 && puntajeBruto <= 27) return "5";
      if (puntajeBruto >= 28 && puntajeBruto <= 30) return "6";
      if (puntajeBruto >= 31 && puntajeBruto <= 32) return "7";
      if (puntajeBruto >= 33 && puntajeBruto <= 34) return "8";
      if (puntajeBruto >= 35 && puntajeBruto <= 36) return "9";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "10";
      if (puntajeBruto >= 39 && puntajeBruto <= 40) return "11";
      if (puntajeBruto >= 41 && puntajeBruto <= 42) return "12";
      if (puntajeBruto >= 43 && puntajeBruto <= 45) return "13";
      if (puntajeBruto >= 46) return "14";
    }
    return "";
  }

  String getLocomotoraIC90(int puntajeBruto) {
    String escalaPuntajeStr =
        getLocomotoraEP(widget.totalLocomotoraScore, widget.ageScore);

    // Verifica si el resultado es un número válido antes de convertir
    int escalaPuntaje;
    if (escalaPuntajeStr.isNotEmpty && int.tryParse(escalaPuntajeStr) != null) {
      escalaPuntaje = int.parse(escalaPuntajeStr);
    } else {
      print(
          "Error: valor no válido para convertir a entero - $escalaPuntajeStr");
      escalaPuntaje = 0; // O algún valor predeterminado en caso de error
    }
    if (escalaPuntaje >= 1 && escalaPuntaje <= 2) return "1-4";
    if (escalaPuntaje == 3) return "2-5";
    if (escalaPuntaje == 4) return "3-6";
    if (escalaPuntaje == 5) return "4-7";
    if (escalaPuntaje == 6) return "5-8";
    if (escalaPuntaje == 7) return "6-9";
    if (escalaPuntaje == 8) return "7-10";
    if (escalaPuntaje == 9) return "8-11";
    if (escalaPuntaje == 10) return "8-12";
    if (escalaPuntaje == 11) return "9-12";
    if (escalaPuntaje == 12) return "10-13";
    if (escalaPuntaje == 13) return "11-14";
    if (escalaPuntaje == 14) return "12-15";
    if (escalaPuntaje == 15) return "13-16";
    if (escalaPuntaje == 16) return "14-17";
    if (escalaPuntaje == 17) return "15-18";
    if (escalaPuntaje == 18) return "16-19";
    if (escalaPuntaje == 19) return "16-20";
    if (escalaPuntaje == 20) return "17-20";
    return "";
  }

  String getLocomotoraIC95(int puntajeBruto) {
    String escalaPuntajeStr =
        getLocomotoraEP(widget.totalLocomotoraScore, widget.ageScore);

    // Verifica si el resultado es un número válido antes de convertir
    int escalaPuntaje;
    if (escalaPuntajeStr.isNotEmpty && int.tryParse(escalaPuntajeStr) != null) {
      escalaPuntaje = int.parse(escalaPuntajeStr);
    } else {
      print(
          "Error: valor no válido para convertir a entero - $escalaPuntajeStr");
      return ""; // O algún valor predeterminado en caso de error
    }

    if (escalaPuntaje == 1) return "1-4";
    if (escalaPuntaje == 2) return "1-5";
    if (escalaPuntaje == 3) return "2-6";
    if (escalaPuntaje == 4) return "3-6";
    if (escalaPuntaje == 5) return "4-7";
    if (escalaPuntaje == 6) return "5-8";
    if (escalaPuntaje == 7) return "5-9";
    if (escalaPuntaje == 8) return "6-10";
    if (escalaPuntaje == 9) return "7-11";
    if (escalaPuntaje == 10) return "8-12";
    if (escalaPuntaje == 11) return "9-13";
    if (escalaPuntaje == 12) return "10-14";
    if (escalaPuntaje == 13) return "11-15";
    if (escalaPuntaje == 14) return "12-15";
    if (escalaPuntaje == 15) return "13-16";
    if (escalaPuntaje == 16) return "14-17";
    if (escalaPuntaje == 17) return "14-18";
    if (escalaPuntaje == 18) return "15-19";
    if (escalaPuntaje == 19) return "16-20";
    if (escalaPuntaje == 20) return "17-20";
    return "";
  }

  String getLocomotoraTD(int puntajeBruto) {
    int escalaPuntaje =
        int.parse(getLocomotoraEP(puntajeBruto, widget.ageScore));
    if (escalaPuntaje >= 1 && escalaPuntaje <= 3) return "Deterioro o retraso";
    if (escalaPuntaje >= 4 && escalaPuntaje <= 5) {
      return "Borde del deterioro o retraso";
    }
    if (escalaPuntaje >= 6 && escalaPuntaje <= 7) {
      return "Por debajo del promedio";
    }
    if (escalaPuntaje >= 8 && escalaPuntaje <= 12) return "Promedio";
    if (escalaPuntaje >= 13 && escalaPuntaje <= 14) {
      return "Encima del promedio";
    }
    if (escalaPuntaje >= 15 && escalaPuntaje <= 16) return "Superior";
    if (escalaPuntaje >= 17 && escalaPuntaje <= 20) {
      return "Con talento o muy avanzado";
    }
    return "";
  }

  String getPelotaEQ(int puntajeBruto, String? gender) {
    if (gender == 'Femenino' && puntajeBruto < 14) {
      return "<3-0";
    } else if (gender == 'Femenino' && puntajeBruto == 14) {
      return "3-0";
    } else if (gender == 'Femino' && puntajeBruto == 15) {
      return "3-6";
    } else if (gender == 'Femenino' && puntajeBruto == 16) {
      return "4-0";
    } else if (gender == 'Femenino' &&
        puntajeBruto >= 17 &&
        puntajeBruto <= 18) {
      return "4-3";
    } else if (gender == 'Femenino' &&
        puntajeBruto >= 19 &&
        puntajeBruto <= 20) {
      return "4-6";
    } else if (gender == 'Femenino' && puntajeBruto == 21) {
      return "4-9";
    } else if (gender == 'Femenino' &&
        puntajeBruto >= 22 &&
        puntajeBruto <= 23) {
      return "5-0";
    } else if (gender == 'Femenino' &&
        puntajeBruto >= 24 &&
        puntajeBruto <= 25) {
      return "5-3";
    } else if (gender == 'Femenino' &&
        puntajeBruto >= 26 &&
        puntajeBruto <= 27) {
      return "5-6";
    } else if (gender == 'Femenino' && puntajeBruto == 28) {
      return "5-9";
    } else if (gender == 'Femenino' &&
        puntajeBruto >= 29 &&
        puntajeBruto <= 31) {
      return "6-0";
    } else if (gender == 'Femenino' &&
        puntajeBruto >= 32 &&
        puntajeBruto <= 33) {
      return "6-3";
    } else if (gender == 'Femenino' && puntajeBruto == 34) {
      return "6-6";
    } else if (gender == 'Femenino' && puntajeBruto == 35) {
      return "6-9";
    } else if (gender == 'Femenino' && puntajeBruto == 36) {
      return "7-0";
    } else if (gender == 'Femenino' && puntajeBruto == 37) {
      return "7-6";
    } else if (gender == 'Femenino' &&
        puntajeBruto >= 38 &&
        puntajeBruto <= 39) {
      return "7-9";
    } else if (gender == 'Femenino' && puntajeBruto == 40) {
      return "8-6";
    } else if (gender == 'Femenino' && puntajeBruto == 41) {
      return "9-3";
    } else if (gender == 'Femenino' && puntajeBruto == 42) {
      return "9-9";
    } else if (gender == 'Femenino' && puntajeBruto == 43) {
      return "10-3";
    } else if (gender == 'Femenino' && puntajeBruto == 44) {
      return "10-9";
    } else if (gender == 'Femenino' && puntajeBruto > 44) {
      return ">10-11";
    } else if (gender == 'Masculino' && puntajeBruto < 17) {
      return "<3-0";
    } else if (gender == 'Masculino' && puntajeBruto == 17) {
      return "3-0";
    } else if (gender == 'Masculino' &&
        puntajeBruto >= 18 &&
        puntajeBruto <= 19) {
      return "3-6";
    } else if (gender == 'Masculino' && puntajeBruto == 20) {
      return "3-9";
    } else if (gender == 'Masculino' &&
        puntajeBruto >= 21 &&
        puntajeBruto <= 22) {
      return "4-0";
    } else if (gender == 'Masculino' && puntajeBruto == 23) {
      return "4-3";
    } else if (gender == 'Masculino' &&
        puntajeBruto >= 24 &&
        puntajeBruto <= 25) {
      return "4-6";
    } else if (gender == 'Masculino' &&
        puntajeBruto >= 26 &&
        puntajeBruto <= 27) {
      return "4-9";
    } else if (gender == 'Masculino' &&
        puntajeBruto >= 28 &&
        puntajeBruto <= 29) {
      return "5-0";
    } else if (gender == 'Masculino' && puntajeBruto == 30) {
      return "5-3";
    } else if (gender == 'Masculino' &&
        puntajeBruto >= 31 &&
        puntajeBruto <= 33) {
      return "5-6";
    } else if (gender == 'Masculino' &&
        puntajeBruto >= 34 &&
        puntajeBruto <= 35) {
      return "5-9";
    } else if (gender == 'Masculino' && puntajeBruto == 36) {
      return "6-0";
    } else if (gender == 'Masculino' && puntajeBruto == 37) {
      return "6-3";
    } else if (gender == 'Masculino' && puntajeBruto == 38) {
      return "6-6";
    }
    return "";
  }

  String getPelotaRP(int puntajeBruto, int ageScore, String? gender) {
    if (ageScore >= 36 && ageScore <= 41 && gender == "Femenino") {
      // 3-0 a 3-5
      if (puntajeBruto >= 0 && puntajeBruto <= 1) return "<1";
      if (puntajeBruto == 2) return "1";
      if (puntajeBruto == 3) return "2";
      if (puntajeBruto == 4) return "5";
      if (puntajeBruto >= 5 && puntajeBruto <= 6) return "9";
      if (puntajeBruto >= 7 && puntajeBruto <= 8) return "16";
      if (puntajeBruto >= 9 && puntajeBruto <= 11) return "25";
      if (puntajeBruto >= 12 && puntajeBruto <= 13) return "37";
      if (puntajeBruto >= 14 && puntajeBruto <= 15) return "50";
      if (puntajeBruto >= 16 && puntajeBruto <= 17) return "63";
      if (puntajeBruto >= 18 && puntajeBruto <= 19) return "75";
      if (puntajeBruto >= 20 && puntajeBruto <= 21) return "84";
      if (puntajeBruto >= 22 && puntajeBruto <= 25) return "91";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "95";
      if (puntajeBruto >= 29 && puntajeBruto <= 34) return "98";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "99";
      if (puntajeBruto >= 38 && puntajeBruto <= 54) return ">99";
    } else if (ageScore >= 42 && ageScore <= 47 && gender == "Femenino") {
      // 3-6 a 3-11
      if (puntajeBruto >= 0 && puntajeBruto <= 1) return "<1";
      if (puntajeBruto == 2) return "1";
      if (puntajeBruto == 3) return "2";
      if (puntajeBruto >= 4 && puntajeBruto <= 5) return "5";
      if (puntajeBruto >= 6 && puntajeBruto <= 7) return "9";
      if (puntajeBruto >= 8 && puntajeBruto <= 10) return "16";
      if (puntajeBruto >= 11 && puntajeBruto <= 12) return "25";
      if (puntajeBruto >= 13 && puntajeBruto <= 14) return "37";
      if (puntajeBruto >= 15 && puntajeBruto <= 16) return "50";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "63";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "75";
      if (puntajeBruto >= 22 && puntajeBruto <= 25) return "84";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "91";
      if (puntajeBruto >= 29 && puntajeBruto <= 34) return "95";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "98";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "99";
      if (puntajeBruto >= 41 && puntajeBruto <= 54) return ">99";
    } else if (ageScore >= 48 && ageScore <= 59 && gender == "Femenino") {
      // 4-0 a 4-11
      if (puntajeBruto >= 0 && puntajeBruto <= 1) return "<1";
      if (puntajeBruto >= 2 && puntajeBruto <= 3) return "1";
      if (puntajeBruto >= 4 && puntajeBruto <= 5) return "2";
      if (puntajeBruto >= 6 && puntajeBruto <= 7) return "5";
      if (puntajeBruto >= 8 && puntajeBruto <= 9) return "9";
      if (puntajeBruto >= 10 && puntajeBruto <= 11) return "16";
      if (puntajeBruto >= 12 && puntajeBruto <= 14) return "25";
      if (puntajeBruto == 15) return "37";
      if (puntajeBruto >= 16 && puntajeBruto <= 18) return "50";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "63";
      if (puntajeBruto >= 22 && puntajeBruto <= 25) return "75";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "84";
      if (puntajeBruto >= 29 && puntajeBruto <= 34) return "91";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "95";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "98";
      if (puntajeBruto >= 41 && puntajeBruto <= 45) return "99";
      if (puntajeBruto >= 46 && puntajeBruto <= 54) return "<99";
    } else if (ageScore >= 60 && ageScore <= 65 && gender == "Femenino") {
      // 5-0 a 5-5
      if (puntajeBruto >= 0 && puntajeBruto <= 2) return "<1";
      if (puntajeBruto >= 3 && puntajeBruto <= 4) return "1";
      if (puntajeBruto >= 5 && puntajeBruto <= 6) return "2";
      if (puntajeBruto >= 7 && puntajeBruto <= 9) return "5";
      if (puntajeBruto >= 10 && puntajeBruto <= 11) return "9";
      if (puntajeBruto >= 12 && puntajeBruto <= 13) return "16";
      if (puntajeBruto >= 14 && puntajeBruto <= 15) return "25";
      if (puntajeBruto >= 16 && puntajeBruto <= 18) return "37";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "50";
      if (puntajeBruto >= 22 && puntajeBruto <= 25) return "63";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "75";
      if (puntajeBruto >= 29 && puntajeBruto <= 34) return "84";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "91";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "95";
      if (puntajeBruto >= 41 && puntajeBruto <= 45) return "98";
      if (puntajeBruto >= 46 && puntajeBruto <= 50) return "99";
      if (puntajeBruto >= 51 && puntajeBruto <= 54) return "<99";
    } else if (ageScore >= 66 && ageScore <= 71 && gender == "Femenino") {
      // 5-6 a 5-11
      if (puntajeBruto >= 0 && puntajeBruto <= 3) return "<1";
      if (puntajeBruto >= 4 && puntajeBruto <= 6) return "1";
      if (puntajeBruto >= 7 && puntajeBruto <= 8) return "2";
      if (puntajeBruto >= 9 && puntajeBruto <= 11) return "5";
      if (puntajeBruto >= 12 && puntajeBruto <= 13) return "9";
      if (puntajeBruto == 14) return "16";
      if (puntajeBruto >= 15 && puntajeBruto <= 18) return "25";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "37";
      if (puntajeBruto >= 22 && puntajeBruto <= 25) return "50";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "63";
      if (puntajeBruto >= 29 && puntajeBruto <= 34) return "75";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "84";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "91";
      if (puntajeBruto >= 41 && puntajeBruto <= 43) return "95";
      if (puntajeBruto >= 44 && puntajeBruto <= 49) return "98";
      if (puntajeBruto >= 50 && puntajeBruto <= 51) return "99";
      if (puntajeBruto >= 52 && puntajeBruto <= 54) return ">99";
    } else if (ageScore >= 72 && ageScore <= 77 && gender == "Femenino") {
      // 6-0 a 6-5
      if (puntajeBruto >= 0 && puntajeBruto <= 5) return "<1";
      if (puntajeBruto >= 6 && puntajeBruto <= 8) return "1";
      if (puntajeBruto >= 9 && puntajeBruto <= 10) return "2";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "5";
      if (puntajeBruto == 14) return "9";
      if (puntajeBruto >= 15 && puntajeBruto <= 18) return "16";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "25";
      if (puntajeBruto >= 22 && puntajeBruto <= 25) return "37";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "50";
      if (puntajeBruto >= 29 && puntajeBruto <= 34) return "63";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "75";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "84";
      if (puntajeBruto >= 41 && puntajeBruto <= 43) return "91";
      if (puntajeBruto >= 44 && puntajeBruto <= 49) return "95";
      if (puntajeBruto >= 50 && puntajeBruto <= 51) return "98";
      if (puntajeBruto == 52) return "99";
      if (puntajeBruto >= 53 && puntajeBruto <= 54) return ">99";
    } else if (ageScore >= 78 && ageScore <= 83 && gender == "Femenino") {
      // 6-6 a 6-11
      if (puntajeBruto >= 0 && puntajeBruto <= 7) return "<1";
      if (puntajeBruto >= 8 && puntajeBruto <= 10) return "1";
      if (puntajeBruto >= 11 && puntajeBruto <= 12) return "2";
      if (puntajeBruto >= 13 && puntajeBruto <= 14) return "5";
      if (puntajeBruto >= 15 && puntajeBruto <= 18) return "9";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "16";
      if (puntajeBruto >= 22 && puntajeBruto <= 25) return "25";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "37";
      if (puntajeBruto >= 29 && puntajeBruto <= 34) return "50";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "63";
      if (puntajeBruto >= 38 && puntajeBruto <= 39) return "75";
      if (puntajeBruto >= 40 && puntajeBruto <= 43) return "84";
      if (puntajeBruto >= 44 && puntajeBruto <= 49) return "91";
      if (puntajeBruto == 50) return "95";
      if (puntajeBruto == 51) return "98";
      if (puntajeBruto == 52) return "99";
      if (puntajeBruto >= 53 && puntajeBruto <= 54) return ">99";
    } else if (ageScore >= 84 && ageScore <= 89 && gender == "Femenino") {
      // 7-0 a 7-5
      if (puntajeBruto >= 0 && puntajeBruto <= 10) return "<1";
      if (puntajeBruto >= 11 && puntajeBruto <= 12) return "1";
      if (puntajeBruto >= 13 && puntajeBruto <= 14) return "2";
      if (puntajeBruto >= 15 && puntajeBruto <= 18) return "5";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "9";
      if (puntajeBruto >= 22 && puntajeBruto <= 24) return "16";
      if (puntajeBruto >= 25 && puntajeBruto <= 28) return "25";
      if (puntajeBruto >= 29 && puntajeBruto <= 31) return "37";
      if (puntajeBruto >= 32 && puntajeBruto <= 35) return "50";
      if (puntajeBruto >= 36 && puntajeBruto <= 38) return "63";
      if (puntajeBruto >= 39 && puntajeBruto <= 41) return "75";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "84";
      if (puntajeBruto >= 45 && puntajeBruto <= 49) return "91";
      if (puntajeBruto == 50) return "95";
      if (puntajeBruto >= 51 && puntajeBruto <= 52) return "98";
      if (puntajeBruto == 53) return "99";
      if (puntajeBruto == 54) return ">99";
    } else if (ageScore >= 90 && ageScore <= 95 && gender == "Femenino") {
      // 7-6 a 7-11
      if (puntajeBruto >= 0 && puntajeBruto <= 12) return "<1";
      if (puntajeBruto >= 13 && puntajeBruto <= 14) return "1";
      if (puntajeBruto >= 15 && puntajeBruto <= 17) return "2";
      if (puntajeBruto >= 18 && puntajeBruto <= 19) return "5";
      if (puntajeBruto >= 20 && puntajeBruto <= 22) return "9";
      if (puntajeBruto >= 23 && puntajeBruto <= 27) return "16";
      if (puntajeBruto >= 28 && puntajeBruto <= 31) return "25";
      if (puntajeBruto >= 32 && puntajeBruto <= 34) return "37";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "50";
      if (puntajeBruto >= 38 && puntajeBruto <= 41) return "63";
      if (puntajeBruto >= 42 && puntajeBruto <= 43) return "75";
      if (puntajeBruto >= 44 && puntajeBruto <= 46) return "84";
      if (puntajeBruto >= 47 && puntajeBruto <= 49) return "91";
      if (puntajeBruto >= 50 && puntajeBruto <= 51) return "95";
      if (puntajeBruto >= 52 && puntajeBruto <= 53) return "98";
      if (puntajeBruto == 54) return "99";
    } else if (ageScore >= 96 && ageScore <= 101 && gender == "Femenino") {
      // 8-0 a 8-5
      if (puntajeBruto >= 0 && puntajeBruto <= 12) return "<1";
      if (puntajeBruto >= 13 && puntajeBruto <= 15) return "1";
      if (puntajeBruto >= 16 && puntajeBruto <= 17) return "2";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "5";
      if (puntajeBruto >= 21 && puntajeBruto <= 27) return "9";
      if (puntajeBruto >= 28 && puntajeBruto <= 31) return "16";
      if (puntajeBruto >= 32 && puntajeBruto <= 33) return "25";
      if (puntajeBruto >= 34 && puntajeBruto <= 36) return "37";
      if (puntajeBruto >= 37 && puntajeBruto <= 39) return "50";
      if (puntajeBruto >= 40 && puntajeBruto <= 42) return "63";
      if (puntajeBruto >= 43 && puntajeBruto <= 46) return "75";
      if (puntajeBruto >= 47 && puntajeBruto <= 48) return "84";
      if (puntajeBruto >= 49 && puntajeBruto <= 51) return "91";
      if (puntajeBruto == 52) return "95";
      if (puntajeBruto >= 53 && puntajeBruto <= 54) return "98";
    } else if (ageScore >= 102 && ageScore <= 107 && gender == "Femenino") {
      // 8-6 a 8-11
      if (puntajeBruto >= 0 && puntajeBruto <= 14) return "<1";
      if (puntajeBruto >= 15 && puntajeBruto <= 17) return "1";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "2";
      if (puntajeBruto >= 21 && puntajeBruto <= 27) return "5";
      if (puntajeBruto >= 28 && puntajeBruto <= 31) return "9";
      if (puntajeBruto >= 32 && puntajeBruto <= 33) return "16";
      if (puntajeBruto >= 34 && puntajeBruto <= 36) return "25";
      if (puntajeBruto >= 37 && puntajeBruto <= 39) return "37";
      if (puntajeBruto == 40) return "50";
      if (puntajeBruto >= 41 && puntajeBruto <= 42) return "63";
      if (puntajeBruto >= 43 && puntajeBruto <= 46) return "75";
      if (puntajeBruto >= 47 && puntajeBruto <= 49) return "84";
      if (puntajeBruto >= 50 && puntajeBruto <= 51) return "91";
      if (puntajeBruto >= 52 && puntajeBruto <= 53) return "95";
      if (puntajeBruto == 54) return "95";
    } else if (ageScore >= 108 && ageScore <= 119 && gender == "Femenino") {
      // 9-0 a 9-11
      if (puntajeBruto >= 0 && puntajeBruto <= 17) return "<1";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "1";
      if (puntajeBruto >= 21 && puntajeBruto <= 27) return "2";
      if (puntajeBruto >= 28 && puntajeBruto <= 31) return "5";
      if (puntajeBruto >= 32 && puntajeBruto <= 33) return "9";
      if (puntajeBruto >= 34 && puntajeBruto <= 36) return "16";
      if (puntajeBruto >= 37 && puntajeBruto <= 39) return "25";
      if (puntajeBruto == 40) return "37";
      if (puntajeBruto >= 41 && puntajeBruto <= 42) return "50";
      if (puntajeBruto >= 43 && puntajeBruto <= 46) return "63";
      if (puntajeBruto >= 47 && puntajeBruto <= 49) return "75";
      if (puntajeBruto >= 50 && puntajeBruto <= 51) return "84";
      if (puntajeBruto >= 52 && puntajeBruto <= 53) return "91";
      if (puntajeBruto >= 54) return "95";
    } else if (ageScore >= 120 && ageScore <= 131 && gender == "Femenino") {
      // 9-0 a 9-11
      if (puntajeBruto >= 0 && puntajeBruto <= 20) return "<1";
      if (puntajeBruto >= 21 && puntajeBruto <= 27) return "1";
      if (puntajeBruto >= 28 && puntajeBruto <= 31) return "2";
      if (puntajeBruto >= 32 && puntajeBruto <= 33) return "5";
      if (puntajeBruto >= 34 && puntajeBruto <= 36) return "9";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "16";
      if (puntajeBruto >= 39 && puntajeBruto <= 40) return "25";
      if (puntajeBruto >= 41 && puntajeBruto <= 42) return "37";
      if (puntajeBruto >= 43 && puntajeBruto <= 44) return "50";
      if (puntajeBruto >= 45 && puntajeBruto <= 48) return "63";
      if (puntajeBruto >= 49 && puntajeBruto <= 50) return "75";
      if (puntajeBruto >= 51 && puntajeBruto <= 52) return "84";
      if (puntajeBruto == 53) return "91";
      if (puntajeBruto == 54) return "95";
    }
    if (ageScore >= 36 && ageScore <= 41 && gender == "Masculino") {
      // 3-0 a 3-5
      if (puntajeBruto == 0) return "<1";
      if (puntajeBruto == 1) return "1";
      if (puntajeBruto >= 2 && puntajeBruto <= 4) return "2";
      if (puntajeBruto >= 5 && puntajeBruto <= 6) return "5";
      if (puntajeBruto == 7) return "9";
      if (puntajeBruto >= 8 && puntajeBruto <= 9) return "16";
      if (puntajeBruto >= 10 && puntajeBruto <= 12) return "25";
      if (puntajeBruto >= 13 && puntajeBruto <= 16) return "37";
      if (puntajeBruto == 17) return "50";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "63";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "75";
      if (puntajeBruto >= 24 && puntajeBruto <= 27) return "84";
      if (puntajeBruto >= 28 && puntajeBruto <= 30) return "91";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "95";
      if (puntajeBruto >= 36 && puntajeBruto <= 38) return "98";
      if (puntajeBruto >= 39 && puntajeBruto <= 42) return "99";
      if (puntajeBruto >= 43 && puntajeBruto <= 54) return ">99";
    } else if (ageScore >= 42 && ageScore <= 47 && gender == "Masculino") {
      // 3-6 a 3-11
      if (puntajeBruto >= 0 && puntajeBruto <= 1) return "<1";
      if (puntajeBruto >= 2 && puntajeBruto <= 3) return "1";
      if (puntajeBruto >= 4 && puntajeBruto <= 5) return "2";
      if (puntajeBruto >= 6 && puntajeBruto <= 7) return "5";
      if (puntajeBruto >= 8 && puntajeBruto <= 9) return "9";
      if (puntajeBruto >= 10 && puntajeBruto <= 12) return "16";
      if (puntajeBruto >= 13 && puntajeBruto <= 16) return "25";
      if (puntajeBruto == 17) return "37";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "50";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "63";
      if (puntajeBruto >= 24 && puntajeBruto <= 27) return "75";
      if (puntajeBruto >= 28 && puntajeBruto <= 30) return "84";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "91";
      if (puntajeBruto >= 36 && puntajeBruto <= 38) return "95";
      if (puntajeBruto >= 39 && puntajeBruto <= 42) return "98";
      if (puntajeBruto >= 43 && puntajeBruto <= 45) return "99";
      if (puntajeBruto >= 46 && puntajeBruto <= 54) return ">99";
    } else if (ageScore >= 48 && ageScore <= 53 && gender == "Masculino") {
      // 4-0 a 4-5
      if (puntajeBruto >= 0 && puntajeBruto <= 1) return "<1";
      if (puntajeBruto >= 2 && puntajeBruto <= 3) return "1";
      if (puntajeBruto >= 4 && puntajeBruto <= 6) return "2";
      if (puntajeBruto >= 7 && puntajeBruto <= 9) return "5";
      if (puntajeBruto >= 10 && puntajeBruto <= 12) return "9";
      if (puntajeBruto >= 13 && puntajeBruto <= 16) return "16";
      if (puntajeBruto == 17) return "25";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "37";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "50";
      if (puntajeBruto >= 24 && puntajeBruto <= 27) return "63";
      if (puntajeBruto >= 28 && puntajeBruto <= 30) return "75";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "84";
      if (puntajeBruto >= 36 && puntajeBruto <= 38) return "91";
      if (puntajeBruto >= 39 && puntajeBruto <= 42) return "95";
      if (puntajeBruto >= 43 && puntajeBruto <= 45) return "98";
      if (puntajeBruto >= 46 && puntajeBruto <= 47) return "99";
      if (puntajeBruto >= 48 && puntajeBruto <= 54) return "<99";
    } else if (ageScore >= 54 && ageScore <= 59 && gender == "Masculino") {
      // 4-6 a 4-11
      if (puntajeBruto >= 0 && puntajeBruto <= 1) return "<1";
      if (puntajeBruto >= 2 && puntajeBruto <= 4) return "1";
      if (puntajeBruto >= 5 && puntajeBruto <= 7) return "2";
      if (puntajeBruto >= 8 && puntajeBruto <= 10) return "5";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "9";
      if (puntajeBruto >= 14 && puntajeBruto <= 17) return "16";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "25";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "37";
      if (puntajeBruto >= 24 && puntajeBruto <= 27) return "50";
      if (puntajeBruto >= 28 && puntajeBruto <= 30) return "63";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "75";
      if (puntajeBruto >= 36 && puntajeBruto <= 38) return "84";
      if (puntajeBruto >= 39 && puntajeBruto <= 42) return "91";
      if (puntajeBruto >= 43 && puntajeBruto <= 44) return "95";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "98";
      if (puntajeBruto >= 47 && puntajeBruto <= 49) return "99";
      if (puntajeBruto >= 50 && puntajeBruto <= 54) return "<99";
    } else if (ageScore >= 60 && ageScore <= 65 && gender == "Masculino") {
      // 5-0 a 5-5
      if (puntajeBruto >= 0 && puntajeBruto <= 3) return "<1";
      if (puntajeBruto >= 4 && puntajeBruto <= 6) return "1";
      if (puntajeBruto >= 7 && puntajeBruto <= 10) return "2";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "5";
      if (puntajeBruto >= 14 && puntajeBruto <= 17) return "9";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "16";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "25";
      if (puntajeBruto >= 24 && puntajeBruto <= 27) return "37";
      if (puntajeBruto >= 28 && puntajeBruto <= 30) return "50";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "63";
      if (puntajeBruto >= 36 && puntajeBruto <= 38) return "75";
      if (puntajeBruto >= 39 && puntajeBruto <= 42) return "84";
      if (puntajeBruto >= 43 && puntajeBruto <= 44) return "91";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "95";
      if (puntajeBruto >= 47 && puntajeBruto <= 49) return "98";
      if (puntajeBruto >= 50 && puntajeBruto <= 53) return "99";
      if (puntajeBruto == 54) return "<99";
    } else if (ageScore >= 66 && ageScore <= 71 && gender == "Masculino") {
      // 5-6 a 5-11
      if (puntajeBruto >= 0 && puntajeBruto <= 6) return "<1";
      if (puntajeBruto >= 7 && puntajeBruto <= 10) return "1";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "2";
      if (puntajeBruto >= 14 && puntajeBruto <= 17) return "5";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "9";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "16";
      if (puntajeBruto >= 24 && puntajeBruto <= 26) return "25";
      if (puntajeBruto >= 27 && puntajeBruto <= 30) return "37";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "50";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "63";
      if (puntajeBruto >= 38 && puntajeBruto <= 41) return "75";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "84";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "91";
      if (puntajeBruto == 47) return "95";
      if (puntajeBruto >= 48 && puntajeBruto <= 52) return "98";
      if (puntajeBruto >= 53 && puntajeBruto <= 54) return "99";
    } else if (ageScore >= 72 && ageScore <= 77 && gender == "Masculino") {
      // 6-0 a 6-5
      if (puntajeBruto >= 0 && puntajeBruto <= 10) return "1";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "1";
      if (puntajeBruto >= 14 && puntajeBruto <= 17) return "2";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "5";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "9";
      if (puntajeBruto >= 24 && puntajeBruto <= 26) return "16";
      if (puntajeBruto >= 27 && puntajeBruto <= 30) return "25";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "37";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "50";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "63";
      if (puntajeBruto >= 41 && puntajeBruto <= 43) return "75";
      if (puntajeBruto >= 44 && puntajeBruto <= 46) return "84";
      if (puntajeBruto == 47) return "91";
      if (puntajeBruto >= 48 && puntajeBruto <= 51) return "95";
      if (puntajeBruto >= 52 && puntajeBruto <= 53) return "98";
      if (puntajeBruto == 54) return "99";
    } else if (ageScore >= 78 && ageScore <= 83 && gender == "Masculino") {
      // 6-6 a 6-11
      if (puntajeBruto >= 0 && puntajeBruto <= 10) return "1";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "2";
      if (puntajeBruto >= 14 && puntajeBruto <= 16) return "3";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "4";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "5";
      if (puntajeBruto >= 22 && puntajeBruto <= 24) return "6";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "7";
      if (puntajeBruto >= 27 && puntajeBruto <= 29) return "8";
      if (puntajeBruto >= 30 && puntajeBruto <= 32) return "9";
      if (puntajeBruto >= 33 && puntajeBruto <= 35) return "10";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "11";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "12";
      if (puntajeBruto >= 41 && puntajeBruto <= 43) return "13";
      if (puntajeBruto >= 44 && puntajeBruto <= 45) return "14";
      if (puntajeBruto >= 46) return "15";
      if (puntajeBruto == 47) return "16";
      if (puntajeBruto == 48) return "17";
      if (puntajeBruto == 49) return "18";
      if (puntajeBruto == 50) return "19";
      if (puntajeBruto == 51) return "20";
    } else if (ageScore >= 84 && ageScore <= 89 && gender == "Masculino") {
      // 7-0 a 7-5
      if (puntajeBruto >= 0 && puntajeBruto <= 13) return "1";
      if (puntajeBruto >= 14 && puntajeBruto <= 17) return "2";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "3";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "4";
      if (puntajeBruto >= 24 && puntajeBruto <= 26) return "5";
      if (puntajeBruto >= 27 && puntajeBruto <= 30) return "6";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "7";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "8";
      if (puntajeBruto >= 38 && puntajeBruto <= 39) return "9";
      if (puntajeBruto >= 40 && puntajeBruto <= 41) return "10";
      if (puntajeBruto >= 42 && puntajeBruto <= 43) return "11";
      if (puntajeBruto == 44) return "12";
      if (puntajeBruto >= 45 && puntajeBruto <= 48) return "13";
      if (puntajeBruto >= 49 && puntajeBruto <= 51) return "14";
      if (puntajeBruto >= 52 && puntajeBruto <= 53) return "15";
      if (puntajeBruto == 54) return "16";
    } else if (ageScore >= 90 && ageScore <= 95 && gender == "Masculino") {
      // 7-6 a 7-11
      if (puntajeBruto >= 0 && puntajeBruto <= 17) return "1";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "2";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "3";
      if (puntajeBruto >= 24 && puntajeBruto <= 26) return "4";
      if (puntajeBruto >= 27 && puntajeBruto <= 30) return "5";
      if (puntajeBruto >= 31 && puntajeBruto <= 34) return "6";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "7";
      if (puntajeBruto >= 38 && puntajeBruto <= 39) return "8";
      if (puntajeBruto >= 40 && puntajeBruto <= 41) return "9";
      if (puntajeBruto >= 42 && puntajeBruto <= 43) return "10";
      if (puntajeBruto == 44) return "11";
      if (puntajeBruto >= 45 && puntajeBruto <= 48) return "12";
      if (puntajeBruto >= 49 && puntajeBruto <= 51) return "13";
      if (puntajeBruto >= 52 && puntajeBruto <= 53) return "14";
      if (puntajeBruto == 54) return "15";
    } else if (ageScore >= 96 && ageScore <= 107 && gender == "Masculino") {
      // 8-0 a 8-11
      if (puntajeBruto >= 0 && puntajeBruto <= 20) return "1";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "2";
      if (puntajeBruto >= 24 && puntajeBruto <= 26) return "3";
      if (puntajeBruto >= 27 && puntajeBruto <= 30) return "4";
      if (puntajeBruto >= 31 && puntajeBruto <= 33) return "5";
      if (puntajeBruto >= 34 && puntajeBruto <= 35) return "6";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "7";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "8";
      if (puntajeBruto >= 41 && puntajeBruto <= 42) return "9";
      if (puntajeBruto >= 43 && puntajeBruto <= 44) return "10";
      if (puntajeBruto >= 45 && puntajeBruto <= 47) return "11";
      if (puntajeBruto >= 48 && puntajeBruto <= 49) return "12";
      if (puntajeBruto >= 50 && puntajeBruto <= 51) return "13";
      if (puntajeBruto >= 52 && puntajeBruto <= 53) return "14";
      if (puntajeBruto == 54) return "15";
    } else if (ageScore >= 108 && ageScore <= 131 && gender == "Masculino") {
      // 9-0 a 10-11
      if (puntajeBruto >= 0 && puntajeBruto <= 23) return "1";
      if (puntajeBruto >= 24 && puntajeBruto <= 26) return "2";
      if (puntajeBruto >= 27 && puntajeBruto <= 29) return "3";
      if (puntajeBruto >= 30 && puntajeBruto <= 32) return "4";
      if (puntajeBruto >= 33 && puntajeBruto <= 35) return "5";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "6";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "7";
      if (puntajeBruto >= 41 && puntajeBruto <= 42) return "8";
      if (puntajeBruto >= 43 && puntajeBruto <= 44) return "9";
      if (puntajeBruto >= 45 && puntajeBruto <= 47) return "10";
      if (puntajeBruto >= 48 && puntajeBruto <= 49) return "11";
      if (puntajeBruto == 50) return "12";
      if (puntajeBruto >= 51 && puntajeBruto <= 52) return "13";
      if (puntajeBruto == 53) return "14";
      if (puntajeBruto == 54) return "15";
    }
    return "";
  }

  String getPelotaEP(int puntajeBruto, int ageScore, String? gender) {
    if (ageScore >= 36 && ageScore <= 41 && gender == "Femenino") {
      // 3-0 a 3-5
      if (puntajeBruto >= 0 && puntajeBruto <= 1) return "2";
      if (puntajeBruto == 2) return "3";
      if (puntajeBruto == 3) return "4";
      if (puntajeBruto == 4) return "5";
      if (puntajeBruto >= 5 && puntajeBruto <= 6) return "6";
      if (puntajeBruto >= 7 && puntajeBruto <= 8) return "7";
      if (puntajeBruto >= 9 && puntajeBruto <= 11) return "8";
      if (puntajeBruto >= 12 && puntajeBruto <= 13) return "9";
      if (puntajeBruto >= 14 && puntajeBruto <= 15) return "10";
      if (puntajeBruto >= 16 && puntajeBruto <= 17) return "11";
      if (puntajeBruto >= 18 && puntajeBruto <= 19) return "12";
      if (puntajeBruto >= 20 && puntajeBruto <= 21) return "13";
      if (puntajeBruto >= 22 && puntajeBruto <= 25) return "14";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "15";
      if (puntajeBruto >= 29 && puntajeBruto <= 34) return "16";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "17";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "18";
      if (puntajeBruto >= 41 && puntajeBruto <= 45) return "19";
      if (puntajeBruto >= 46 && puntajeBruto <= 54) return "20";
    } else if (ageScore >= 42 && ageScore <= 47 && gender == "Femenino") {
      // 3-6 a 3-11
      if (puntajeBruto >= 0 && puntajeBruto <= 1) return "2";
      if (puntajeBruto == 2) return "3";
      if (puntajeBruto == 3) return "4";
      if (puntajeBruto >= 4 && puntajeBruto <= 5) return "5";
      if (puntajeBruto >= 6 && puntajeBruto <= 7) return "6";
      if (puntajeBruto >= 8 && puntajeBruto <= 10) return "7";
      if (puntajeBruto >= 11 && puntajeBruto <= 12) return "8";
      if (puntajeBruto >= 13 && puntajeBruto <= 14) return "9";
      if (puntajeBruto >= 15 && puntajeBruto <= 16) return "10";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "11";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "12";
      if (puntajeBruto >= 22 && puntajeBruto <= 25) return "13";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "14";
      if (puntajeBruto >= 29 && puntajeBruto <= 34) return "15";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "16";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "17";
      if (puntajeBruto >= 41 && puntajeBruto <= 45) return "18";
      if (puntajeBruto >= 46 && puntajeBruto <= 52) return "19";
      if (puntajeBruto >= 43 && puntajeBruto <= 54) return "20";
    } else if (ageScore >= 48 && ageScore <= 59 && gender == "Femenino") {
      // 4-0 a 4-11
      if (puntajeBruto >= 0 && puntajeBruto <= 1) return "2";
      if (puntajeBruto >= 2 && puntajeBruto <= 3) return "3";
      if (puntajeBruto >= 4 && puntajeBruto <= 5) return "4";
      if (puntajeBruto >= 6 && puntajeBruto <= 7) return "5";
      if (puntajeBruto >= 8 && puntajeBruto <= 9) return "6";
      if (puntajeBruto >= 10 && puntajeBruto <= 11) return "7";
      if (puntajeBruto >= 12 && puntajeBruto <= 14) return "8";
      if (puntajeBruto == 15) return "9";
      if (puntajeBruto >= 16 && puntajeBruto <= 18) return "10";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "11";
      if (puntajeBruto >= 22 && puntajeBruto <= 25) return "12";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "13";
      if (puntajeBruto >= 29 && puntajeBruto <= 34) return "14";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "15";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "16";
      if (puntajeBruto >= 41 && puntajeBruto <= 45) return "17";
      if (puntajeBruto >= 46 && puntajeBruto <= 51) return "18";
      if (puntajeBruto == 52) return "19";
      if (puntajeBruto >= 53 && puntajeBruto <= 54) return "20";
    } else if (ageScore >= 60 && ageScore <= 65 && gender == "Femenino") {
      // 5-0 a 5-5
      if (puntajeBruto >= 0 && puntajeBruto <= 2) return "2";
      if (puntajeBruto >= 3 && puntajeBruto <= 4) return "3";
      if (puntajeBruto >= 5 && puntajeBruto <= 6) return "4";
      if (puntajeBruto >= 7 && puntajeBruto <= 9) return "5";
      if (puntajeBruto >= 10 && puntajeBruto <= 11) return "6";
      if (puntajeBruto >= 12 && puntajeBruto <= 13) return "7";
      if (puntajeBruto >= 14 && puntajeBruto <= 15) return "8";
      if (puntajeBruto >= 16 && puntajeBruto <= 18) return "9";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "10";
      if (puntajeBruto >= 22 && puntajeBruto <= 25) return "11";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "12";
      if (puntajeBruto >= 29 && puntajeBruto <= 34) return "13";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "14";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "15";
      if (puntajeBruto >= 41 && puntajeBruto <= 45) return "16";
      if (puntajeBruto >= 46 && puntajeBruto <= 50) return "17";
      if (puntajeBruto == 51) return "18";
      if (puntajeBruto == 52) return "19";
      if (puntajeBruto >= 53 && puntajeBruto <= 54) return "20";
    } else if (ageScore >= 66 && ageScore <= 71 && gender == "Femenino") {
      // 5-6 a 5-11
      if (puntajeBruto >= 0 && puntajeBruto <= 1) return "1";
      if (puntajeBruto >= 2 && puntajeBruto <= 3) return "2";
      if (puntajeBruto >= 4 && puntajeBruto <= 6) return "3";
      if (puntajeBruto >= 7 && puntajeBruto <= 8) return "4";
      if (puntajeBruto >= 9 && puntajeBruto <= 11) return "5";
      if (puntajeBruto >= 12 && puntajeBruto <= 13) return "6";
      if (puntajeBruto == 14) return "7";
      if (puntajeBruto >= 15 && puntajeBruto <= 18) return "8";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "9";
      if (puntajeBruto >= 22 && puntajeBruto <= 25) return "10";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "11";
      if (puntajeBruto >= 29 && puntajeBruto <= 34) return "12";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "13";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "14";
      if (puntajeBruto >= 41 && puntajeBruto <= 43) return "15";
      if (puntajeBruto >= 44 && puntajeBruto <= 49) return "16";
      if (puntajeBruto >= 50 && puntajeBruto <= 51) return "17";
      if (puntajeBruto == 52) return "18";
      if (puntajeBruto == 53) return "19";
      if (puntajeBruto == 54) return "20";
    } else if (ageScore >= 72 && ageScore <= 77 && gender == "Femenino") {
      // 6-0 a 6-5
      if (puntajeBruto >= 0 && puntajeBruto <= 3) return "1";
      if (puntajeBruto >= 4 && puntajeBruto <= 5) return "2";
      if (puntajeBruto >= 6 && puntajeBruto <= 8) return "3";
      if (puntajeBruto >= 9 && puntajeBruto <= 10) return "4";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "5";
      if (puntajeBruto == 14) return "6";
      if (puntajeBruto >= 15 && puntajeBruto <= 18) return "7";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "8";
      if (puntajeBruto >= 22 && puntajeBruto <= 25) return "9";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "10";
      if (puntajeBruto >= 29 && puntajeBruto <= 34) return "11";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "12";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "13";
      if (puntajeBruto >= 41 && puntajeBruto <= 43) return "14";
      if (puntajeBruto >= 44 && puntajeBruto <= 49) return "15";
      if (puntajeBruto >= 50 && puntajeBruto <= 51) return "16";
      if (puntajeBruto == 52) return "17";
      if (puntajeBruto == 53) return "18";
      if (puntajeBruto == 54) return "19";
    } else if (ageScore >= 78 && ageScore <= 83 && gender == "Femenino") {
      // 6-6 a 6-11
      if (puntajeBruto >= 0 && puntajeBruto <= 5) return "1";
      if (puntajeBruto >= 6 && puntajeBruto <= 7) return "2";
      if (puntajeBruto >= 8 && puntajeBruto <= 10) return "3";
      if (puntajeBruto >= 11 && puntajeBruto <= 12) return "4";
      if (puntajeBruto >= 13 && puntajeBruto <= 14) return "5";
      if (puntajeBruto >= 15 && puntajeBruto <= 18) return "6";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "7";
      if (puntajeBruto >= 22 && puntajeBruto <= 25) return "8";
      if (puntajeBruto >= 26 && puntajeBruto <= 28) return "9";
      if (puntajeBruto >= 29 && puntajeBruto <= 34) return "10";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "11";
      if (puntajeBruto >= 38 && puntajeBruto <= 39) return "12";
      if (puntajeBruto >= 40 && puntajeBruto <= 43) return "13";
      if (puntajeBruto >= 44 && puntajeBruto <= 49) return "14";
      if (puntajeBruto == 50) return "15";
      if (puntajeBruto == 51) return "16";
      if (puntajeBruto == 52) return "17";
      if (puntajeBruto == 52) return "18";
      if (puntajeBruto == 52) return "19";
    } else if (ageScore >= 84 && ageScore <= 89 && gender == "Femenino") {
      // 7-0 a 7-5
      if (puntajeBruto >= 0 && puntajeBruto <= 7) return "1";
      if (puntajeBruto >= 8 && puntajeBruto <= 10) return "2";
      if (puntajeBruto >= 11 && puntajeBruto <= 12) return "3";
      if (puntajeBruto >= 13 && puntajeBruto <= 14) return "4";
      if (puntajeBruto >= 15 && puntajeBruto <= 18) return "5";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "6";
      if (puntajeBruto >= 22 && puntajeBruto <= 24) return "7";
      if (puntajeBruto >= 25 && puntajeBruto <= 28) return "8";
      if (puntajeBruto >= 29 && puntajeBruto <= 31) return "9";
      if (puntajeBruto >= 32 && puntajeBruto <= 35) return "10";
      if (puntajeBruto >= 36 && puntajeBruto <= 38) return "11";
      if (puntajeBruto >= 39 && puntajeBruto <= 41) return "12";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "13";
      if (puntajeBruto >= 45 && puntajeBruto <= 49) return "14";
      if (puntajeBruto == 50) return "15";
      if (puntajeBruto >= 51 && puntajeBruto <= 52) return "16";
      if (puntajeBruto == 53) return "17";
      if (puntajeBruto == 54) return "18";
    } else if (ageScore >= 90 && ageScore <= 95 && gender == "Femenino") {
      // 7-6 a 7-11
      if (puntajeBruto >= 0 && puntajeBruto <= 10) return "1";
      if (puntajeBruto >= 11 && puntajeBruto <= 12) return "2";
      if (puntajeBruto >= 13 && puntajeBruto <= 14) return "3";
      if (puntajeBruto >= 15 && puntajeBruto <= 17) return "4";
      if (puntajeBruto >= 18 && puntajeBruto <= 19) return "5";
      if (puntajeBruto >= 20 && puntajeBruto <= 22) return "6";
      if (puntajeBruto >= 23 && puntajeBruto <= 27) return "7";
      if (puntajeBruto >= 28 && puntajeBruto <= 31) return "8";
      if (puntajeBruto >= 32 && puntajeBruto <= 34) return "9";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "10";
      if (puntajeBruto >= 38 && puntajeBruto <= 41) return "11";
      if (puntajeBruto >= 42 && puntajeBruto <= 43) return "12";
      if (puntajeBruto >= 44 && puntajeBruto <= 46) return "13";
      if (puntajeBruto >= 47 && puntajeBruto <= 49) return "14";
      if (puntajeBruto >= 50 && puntajeBruto <= 51) return "15";
      if (puntajeBruto >= 52 && puntajeBruto <= 53) return "16";
      if (puntajeBruto == 54) return "17";
    } else if (ageScore >= 96 && ageScore <= 101 && gender == "Femenino") {
      // 8-0 a 8-5
      if (puntajeBruto >= 0 && puntajeBruto <= 10) return "1";
      if (puntajeBruto >= 11 && puntajeBruto <= 12) return "2";
      if (puntajeBruto >= 13 && puntajeBruto <= 15) return "3";
      if (puntajeBruto >= 16 && puntajeBruto <= 17) return "4";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "5";
      if (puntajeBruto >= 21 && puntajeBruto <= 27) return "6";
      if (puntajeBruto >= 28 && puntajeBruto <= 31) return "7";
      if (puntajeBruto >= 32 && puntajeBruto <= 33) return "8";
      if (puntajeBruto >= 34 && puntajeBruto <= 36) return "9";
      if (puntajeBruto >= 37 && puntajeBruto <= 39) return "10";
      if (puntajeBruto >= 40 && puntajeBruto <= 42) return "11";
      if (puntajeBruto >= 43 && puntajeBruto <= 46) return "12";
      if (puntajeBruto >= 47 && puntajeBruto <= 48) return "13";
      if (puntajeBruto >= 49 && puntajeBruto <= 51) return "14";
      if (puntajeBruto == 52) return "15";
      if (puntajeBruto >= 53 && puntajeBruto <= 54) return "16";
    } else if (ageScore >= 102 && ageScore <= 107 && gender == "Femenino") {
      // 8-6 a 8-11
      if (puntajeBruto >= 0 && puntajeBruto <= 12) return "1";
      if (puntajeBruto >= 13 && puntajeBruto <= 14) return "2";
      if (puntajeBruto >= 15 && puntajeBruto <= 17) return "3";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "4";
      if (puntajeBruto >= 21 && puntajeBruto <= 27) return "5";
      if (puntajeBruto >= 28 && puntajeBruto <= 31) return "6";
      if (puntajeBruto >= 32 && puntajeBruto <= 33) return "7";
      if (puntajeBruto >= 34 && puntajeBruto <= 36) return "8";
      if (puntajeBruto >= 37 && puntajeBruto <= 39) return "9";
      if (puntajeBruto == 40) return "10";
      if (puntajeBruto >= 41 && puntajeBruto <= 42) return "11";
      if (puntajeBruto >= 43 && puntajeBruto <= 46) return "12";
      if (puntajeBruto >= 47 && puntajeBruto <= 49) return "13";
      if (puntajeBruto >= 50 && puntajeBruto <= 51) return "14";
      if (puntajeBruto >= 52 && puntajeBruto <= 53) return "15";
      if (puntajeBruto == 54) return "16";
    } else if (ageScore >= 108 && ageScore <= 119 && gender == "Femenino") {
      // 9-0 a 9-11
      if (puntajeBruto >= 0 && puntajeBruto <= 14) return "1";
      if (puntajeBruto >= 15 && puntajeBruto <= 17) return "2";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "3";
      if (puntajeBruto >= 21 && puntajeBruto <= 27) return "4";
      if (puntajeBruto >= 28 && puntajeBruto <= 31) return "5";
      if (puntajeBruto >= 32 && puntajeBruto <= 33) return "6";
      if (puntajeBruto >= 34 && puntajeBruto <= 36) return "7";
      if (puntajeBruto >= 37 && puntajeBruto <= 39) return "8";
      if (puntajeBruto == 40) return "9";
      if (puntajeBruto >= 41 && puntajeBruto <= 42) return "10";
      if (puntajeBruto >= 43 && puntajeBruto <= 46) return "11";
      if (puntajeBruto >= 47 && puntajeBruto <= 49) return "12";
      if (puntajeBruto >= 50 && puntajeBruto <= 51) return "13";
      if (puntajeBruto >= 52 && puntajeBruto <= 53) return "14";
      if (puntajeBruto >= 54) return "15";
    } else if (ageScore >= 120 && ageScore <= 131 && gender == "Femenino") {
      // 10-0 a 10-11
      if (puntajeBruto >= 0 && puntajeBruto <= 17) return "1";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "2";
      if (puntajeBruto >= 21 && puntajeBruto <= 27) return "3";
      if (puntajeBruto >= 28 && puntajeBruto <= 31) return "4";
      if (puntajeBruto >= 32 && puntajeBruto <= 33) return "5";
      if (puntajeBruto >= 34 && puntajeBruto <= 36) return "6";
      if (puntajeBruto >= 37 && puntajeBruto <= 38) return "7";
      if (puntajeBruto >= 39 && puntajeBruto <= 40) return "8";
      if (puntajeBruto >= 41 && puntajeBruto <= 42) return "9";
      if (puntajeBruto >= 43 && puntajeBruto <= 44) return "10";
      if (puntajeBruto >= 45 && puntajeBruto <= 48) return "11";
      if (puntajeBruto >= 49 && puntajeBruto <= 50) return "12";
      if (puntajeBruto >= 51 && puntajeBruto <= 52) return "13";
      if (puntajeBruto == 53) return "14";
      if (puntajeBruto == 54) return "15";
    }
    if (ageScore >= 36 && ageScore <= 41 && gender == "Masculino") {
      // 3-0 a 3-5
      if (puntajeBruto == 0) return "2";
      if (puntajeBruto == 1) return "3";
      if (puntajeBruto >= 2 && puntajeBruto <= 4) return "4";
      if (puntajeBruto >= 5 && puntajeBruto <= 6) return "5";
      if (puntajeBruto == 7) return "6";
      if (puntajeBruto >= 8 && puntajeBruto <= 9) return "7";
      if (puntajeBruto >= 10 && puntajeBruto <= 12) return "8";
      if (puntajeBruto >= 13 && puntajeBruto <= 16) return "9";
      if (puntajeBruto == 17) return "10";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "11";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "12";
      if (puntajeBruto >= 24 && puntajeBruto <= 27) return "13";
      if (puntajeBruto >= 28 && puntajeBruto <= 30) return "14";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "15";
      if (puntajeBruto >= 36 && puntajeBruto <= 38) return "16";
      if (puntajeBruto >= 39 && puntajeBruto <= 42) return "17";
      if (puntajeBruto >= 43 && puntajeBruto <= 45) return "18";
      if (puntajeBruto >= 46 && puntajeBruto <= 48) return "19";
      if (puntajeBruto >= 49 && puntajeBruto <= 54) return "20";
    } else if (ageScore >= 42 && ageScore <= 47 && gender == "Masculino") {
      // 3-6 a 3-11
      if (puntajeBruto == 0) return "1";
      if (puntajeBruto == 1) return "2";
      if (puntajeBruto >= 2 && puntajeBruto <= 3) return "3";
      if (puntajeBruto >= 4 && puntajeBruto <= 5) return "4";
      if (puntajeBruto >= 6 && puntajeBruto <= 7) return "5";
      if (puntajeBruto >= 8 && puntajeBruto <= 9) return "6";
      if (puntajeBruto >= 10 && puntajeBruto <= 12) return "7";
      if (puntajeBruto >= 13 && puntajeBruto <= 16) return "8";
      if (puntajeBruto == 17) return "9";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "10";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "11";
      if (puntajeBruto >= 24 && puntajeBruto <= 27) return "12";
      if (puntajeBruto >= 28 && puntajeBruto <= 30) return "13";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "14";
      if (puntajeBruto >= 36 && puntajeBruto <= 38) return "15";
      if (puntajeBruto >= 39 && puntajeBruto <= 42) return "16";
      if (puntajeBruto >= 43 && puntajeBruto <= 45) return "17";
      if (puntajeBruto >= 46 && puntajeBruto <= 48) return "18";
      if (puntajeBruto >= 49 && puntajeBruto <= 51) return "19";
      if (puntajeBruto >= 52 && puntajeBruto <= 54) return "20";
    } else if (ageScore >= 48 && ageScore <= 53 && gender == "Masculino") {
      // 4-0 a 4-5
      if (puntajeBruto >= 0 && puntajeBruto <= 1) return "1";
      if (puntajeBruto == 1) return "2";
      if (puntajeBruto >= 2 && puntajeBruto <= 3) return "3";
      if (puntajeBruto >= 4 && puntajeBruto <= 6) return "4";
      if (puntajeBruto >= 7 && puntajeBruto <= 9) return "5";
      if (puntajeBruto >= 10 && puntajeBruto <= 12) return "6";
      if (puntajeBruto >= 13 && puntajeBruto <= 16) return "7";
      if (puntajeBruto == 17) return "8";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "9";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "10";
      if (puntajeBruto >= 24 && puntajeBruto <= 27) return "11";
      if (puntajeBruto >= 28 && puntajeBruto <= 30) return "12";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "13";
      if (puntajeBruto >= 36 && puntajeBruto <= 38) return "14";
      if (puntajeBruto >= 39 && puntajeBruto <= 42) return "15";
      if (puntajeBruto >= 43 && puntajeBruto <= 45) return "16";
      if (puntajeBruto >= 46 && puntajeBruto <= 47) return "17";
      if (puntajeBruto >= 48 && puntajeBruto <= 51) return "18";
      if (puntajeBruto >= 52 && puntajeBruto <= 54) return "19";
    } else if (ageScore >= 48 && ageScore <= 53 && gender == "Masculino") {
      // 4-6 a 4-11
      if (puntajeBruto == 0) return "1";
      if (puntajeBruto == 1) return "2";
      if (puntajeBruto >= 2 && puntajeBruto <= 4) return "3";
      if (puntajeBruto >= 5 && puntajeBruto <= 7) return "4";
      if (puntajeBruto >= 8 && puntajeBruto <= 10) return "5";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "6";
      if (puntajeBruto >= 14 && puntajeBruto <= 17) return "7";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "8";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "9";
      if (puntajeBruto >= 24 && puntajeBruto <= 27) return "10";
      if (puntajeBruto >= 28 && puntajeBruto <= 30) return "11";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "12";
      if (puntajeBruto >= 36 && puntajeBruto <= 38) return "13";
      if (puntajeBruto >= 39 && puntajeBruto <= 42) return "14";
      if (puntajeBruto >= 43 && puntajeBruto <= 44) return "15";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "16";
      if (puntajeBruto >= 47 && puntajeBruto <= 49) return "17";
      if (puntajeBruto >= 50 && puntajeBruto <= 53) return "18";
      if (puntajeBruto == 54) return "19";
    } else if (ageScore >= 60 && ageScore <= 65 && gender == "Masculino") {
      // 5-0 a 5-5
      if (puntajeBruto == 0) return "1";
      if (puntajeBruto >= 1 && puntajeBruto <= 3) return "2";
      if (puntajeBruto >= 4 && puntajeBruto <= 6) return "3";
      if (puntajeBruto >= 7 && puntajeBruto <= 10) return "4";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "5";
      if (puntajeBruto >= 14 && puntajeBruto <= 17) return "6";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "7";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "8";
      if (puntajeBruto >= 24 && puntajeBruto <= 27) return "9";
      if (puntajeBruto >= 28 && puntajeBruto <= 30) return "10";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "11";
      if (puntajeBruto >= 36 && puntajeBruto <= 38) return "12";
      if (puntajeBruto >= 39 && puntajeBruto <= 42) return "13";
      if (puntajeBruto >= 43 && puntajeBruto <= 44) return "14";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "15";
      if (puntajeBruto >= 47 && puntajeBruto <= 49) return "16";
      if (puntajeBruto >= 50 && puntajeBruto <= 53) return "17";
      if (puntajeBruto == 54) return "18";
    } else if (ageScore >= 66 && ageScore <= 71 && gender == "Masculino") {
      // 5-6 a 5-11
      if (puntajeBruto >= 0 && puntajeBruto <= 3) return "1";
      if (puntajeBruto >= 4 && puntajeBruto <= 6) return "2";
      if (puntajeBruto >= 7 && puntajeBruto <= 10) return "3";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "4";
      if (puntajeBruto >= 14 && puntajeBruto <= 17) return "5";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "6";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "7";
      if (puntajeBruto >= 24 && puntajeBruto <= 26) return "8";
      if (puntajeBruto >= 27 && puntajeBruto <= 30) return "9";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "10";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "11";
      if (puntajeBruto >= 38 && puntajeBruto <= 41) return "12";
      if (puntajeBruto >= 42 && puntajeBruto <= 44) return "13";
      if (puntajeBruto >= 45 && puntajeBruto <= 46) return "14";
      if (puntajeBruto == 47) return "15";
      if (puntajeBruto >= 48 && puntajeBruto <= 52) return "16";
      if (puntajeBruto >= 53 && puntajeBruto <= 54) return "17";
    } else if (ageScore >= 72 && ageScore <= 77 && gender == "Masculino") {
      // 6-0 a 6-5
      if (puntajeBruto >= 0 && puntajeBruto <= 6) return "1";
      if (puntajeBruto >= 7 && puntajeBruto <= 10) return "2";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "3";
      if (puntajeBruto >= 14 && puntajeBruto <= 17) return "4";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "5";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "6";
      if (puntajeBruto >= 24 && puntajeBruto <= 26) return "7";
      if (puntajeBruto >= 27 && puntajeBruto <= 30) return "8";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "9";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "10";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "11";
      if (puntajeBruto >= 41 && puntajeBruto <= 43) return "12";
      if (puntajeBruto >= 44 && puntajeBruto <= 46) return "13";
      if (puntajeBruto == 47) return "14";
      if (puntajeBruto >= 48 && puntajeBruto <= 51) return "15";
      if (puntajeBruto >= 52 && puntajeBruto <= 53) return "16";
      if (puntajeBruto == 54) return "17";
    } else if (ageScore >= 78 && ageScore <= 83 && gender == "Masculino") {
      // 6-6 a 6-11
      if (puntajeBruto >= 0 && puntajeBruto <= 10) return "1";
      if (puntajeBruto >= 11 && puntajeBruto <= 13) return "2";
      if (puntajeBruto >= 14 && puntajeBruto <= 16) return "3";
      if (puntajeBruto >= 17 && puntajeBruto <= 18) return "4";
      if (puntajeBruto >= 19 && puntajeBruto <= 21) return "5";
      if (puntajeBruto >= 22 && puntajeBruto <= 24) return "6";
      if (puntajeBruto >= 25 && puntajeBruto <= 26) return "7";
      if (puntajeBruto >= 27 && puntajeBruto <= 29) return "8";
      if (puntajeBruto >= 30 && puntajeBruto <= 32) return "9";
      if (puntajeBruto >= 33 && puntajeBruto <= 35) return "10";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "11";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "12";
      if (puntajeBruto >= 41 && puntajeBruto <= 43) return "13";
      if (puntajeBruto >= 44 && puntajeBruto <= 45) return "14";
      if (puntajeBruto >= 46) return "15";
      if (puntajeBruto == 47) return "16";
      if (puntajeBruto == 48) return "17";
      if (puntajeBruto == 49) return "18";
      if (puntajeBruto == 50) return "19";
      if (puntajeBruto == 51) return "20";
    } else if (ageScore >= 84 && ageScore <= 89 && gender == "Masculino") {
      // 7-0 a 7-5
      if (puntajeBruto >= 0 && puntajeBruto <= 13) return "1";
      if (puntajeBruto >= 14 && puntajeBruto <= 17) return "2";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "3";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "4";
      if (puntajeBruto >= 24 && puntajeBruto <= 26) return "5";
      if (puntajeBruto >= 27 && puntajeBruto <= 30) return "6";
      if (puntajeBruto >= 31 && puntajeBruto <= 35) return "7";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "8";
      if (puntajeBruto >= 38 && puntajeBruto <= 39) return "9";
      if (puntajeBruto >= 40 && puntajeBruto <= 41) return "10";
      if (puntajeBruto >= 42 && puntajeBruto <= 43) return "11";
      if (puntajeBruto == 44) return "12";
      if (puntajeBruto >= 45 && puntajeBruto <= 48) return "13";
      if (puntajeBruto >= 49 && puntajeBruto <= 51) return "14";
      if (puntajeBruto >= 52 && puntajeBruto <= 53) return "15";
      if (puntajeBruto == 54) return "16";
    } else if (ageScore >= 90 && ageScore <= 95 && gender == "Masculino") {
      // 7-6 a 7-11
      if (puntajeBruto >= 0 && puntajeBruto <= 17) return "1";
      if (puntajeBruto >= 18 && puntajeBruto <= 20) return "2";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "3";
      if (puntajeBruto >= 24 && puntajeBruto <= 26) return "4";
      if (puntajeBruto >= 27 && puntajeBruto <= 30) return "5";
      if (puntajeBruto >= 31 && puntajeBruto <= 34) return "6";
      if (puntajeBruto >= 35 && puntajeBruto <= 37) return "7";
      if (puntajeBruto >= 38 && puntajeBruto <= 39) return "8";
      if (puntajeBruto >= 40 && puntajeBruto <= 41) return "9";
      if (puntajeBruto >= 42 && puntajeBruto <= 43) return "10";
      if (puntajeBruto == 44) return "11";
      if (puntajeBruto >= 45 && puntajeBruto <= 48) return "12";
      if (puntajeBruto >= 49 && puntajeBruto <= 51) return "13";
      if (puntajeBruto >= 52 && puntajeBruto <= 53) return "14";
      if (puntajeBruto == 54) return "15";
    } else if (ageScore >= 96 && ageScore <= 107 && gender == "Masculino") {
      // 8-0 a 8-11
      if (puntajeBruto >= 0 && puntajeBruto <= 20) return "1";
      if (puntajeBruto >= 21 && puntajeBruto <= 23) return "2";
      if (puntajeBruto >= 24 && puntajeBruto <= 26) return "3";
      if (puntajeBruto >= 27 && puntajeBruto <= 30) return "4";
      if (puntajeBruto >= 31 && puntajeBruto <= 33) return "5";
      if (puntajeBruto >= 34 && puntajeBruto <= 35) return "6";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "7";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "8";
      if (puntajeBruto >= 41 && puntajeBruto <= 42) return "9";
      if (puntajeBruto >= 43 && puntajeBruto <= 44) return "10";
      if (puntajeBruto >= 45 && puntajeBruto <= 47) return "11";
      if (puntajeBruto >= 48 && puntajeBruto <= 49) return "12";
      if (puntajeBruto >= 50 && puntajeBruto <= 51) return "13";
      if (puntajeBruto >= 52 && puntajeBruto <= 53) return "14";
      if (puntajeBruto == 54) return "15";
    } else if (ageScore >= 108 && ageScore <= 131 && gender == "Masculino") {
      // 9-0 a 10-11
      if (puntajeBruto >= 0 && puntajeBruto <= 23) return "1";
      if (puntajeBruto >= 24 && puntajeBruto <= 26) return "2";
      if (puntajeBruto >= 27 && puntajeBruto <= 29) return "3";
      if (puntajeBruto >= 30 && puntajeBruto <= 32) return "4";
      if (puntajeBruto >= 33 && puntajeBruto <= 35) return "5";
      if (puntajeBruto >= 36 && puntajeBruto <= 37) return "6";
      if (puntajeBruto >= 38 && puntajeBruto <= 40) return "7";
      if (puntajeBruto >= 41 && puntajeBruto <= 42) return "8";
      if (puntajeBruto >= 43 && puntajeBruto <= 44) return "9";
      if (puntajeBruto >= 45 && puntajeBruto <= 47) return "10";
      if (puntajeBruto >= 48 && puntajeBruto <= 49) return "11";
      if (puntajeBruto == 50) return "12";
      if (puntajeBruto >= 51 && puntajeBruto <= 52) return "13";
      if (puntajeBruto == 53) return "14";
      if (puntajeBruto == 54) return "15";
    }
    return "";
  }

  String getPelotaIC90(int puntajeBruto) {
    int escalaPuntaje = int.parse(
        getPelotaEP(widget.totalPelotaScore, widget.ageScore, widget.gender));
    if (escalaPuntaje == 1) return "1-4";
    if (escalaPuntaje == 2) return "1-5";
    if (escalaPuntaje == 3) return "2-5";
    if (escalaPuntaje == 4) return "3-6";
    if (escalaPuntaje == 5) return "4-7";
    if (escalaPuntaje == 6) return "5-8";
    if (escalaPuntaje == 7) return "6-9";
    if (escalaPuntaje == 8) return "7-10";
    if (escalaPuntaje == 9) return "8-11";
    if (escalaPuntaje == 10) return "8-12";
    if (escalaPuntaje == 11) return "9-12";
    if (escalaPuntaje == 12) return "10-13";
    if (escalaPuntaje == 13) return "11-14";
    if (escalaPuntaje == 14) return "12-15";
    if (escalaPuntaje == 15) return "13-16";
    if (escalaPuntaje == 16) return "14-17";
    if (escalaPuntaje == 17) return "15-18";
    if (escalaPuntaje == 18) return "15-19";
    if (escalaPuntaje == 19) return "16-20";
    if (escalaPuntaje == 20) return "17-20";
    return "";
  }

  String getPelotaIC95(int puntajeBruto) {
    int escalaPuntaje = int.parse(
        getPelotaEP(widget.totalPelotaScore, widget.ageScore, widget.gender));
    if (escalaPuntaje == 1) return "1-4";
    if (escalaPuntaje == 2) return "1-5";
    if (escalaPuntaje == 3) return "2-6";
    if (escalaPuntaje == 4) return "3-7";
    if (escalaPuntaje == 5) return "4-8";
    if (escalaPuntaje == 6) return "5-8";
    if (escalaPuntaje == 7) return "5-9";
    if (escalaPuntaje == 8) return "6-10";
    if (escalaPuntaje == 9) return "7-11";
    if (escalaPuntaje == 10) return "8-12";
    if (escalaPuntaje == 11) return "9-13";
    if (escalaPuntaje == 12) return "10-14";
    if (escalaPuntaje == 13) return "11-15";
    if (escalaPuntaje == 14) return "12-15";
    if (escalaPuntaje == 15) return "12-16";
    if (escalaPuntaje == 16) return "13-17";
    if (escalaPuntaje == 17) return "14-18";
    if (escalaPuntaje == 18) return "15-19";
    if (escalaPuntaje == 19) return "16-20";
    if (escalaPuntaje == 20) return "17-20";
    return "";
  }

  String getPelotaTD(int puntajeBruto) {
    int escalaPuntaje = int.parse(
        getPelotaEP(widget.totalPelotaScore, widget.ageScore, widget.gender));
    if (escalaPuntaje >= 1 && escalaPuntaje <= 3) return "Deterioro o retraso";
    if (escalaPuntaje >= 4 && escalaPuntaje <= 5) {
      return "Borde del deterioro o retraso";
    }
    if (escalaPuntaje >= 6 && escalaPuntaje <= 7) {
      return "Por debajo del promedio";
    }
    if (escalaPuntaje >= 8 && escalaPuntaje <= 12) return "Promedio";
    if (escalaPuntaje >= 13 && escalaPuntaje <= 14) {
      return "Encima del promedio";
    }
    if (escalaPuntaje >= 15 && escalaPuntaje <= 16) return "Superior";
    if (escalaPuntaje >= 17 && escalaPuntaje <= 20) {
      return "Con talento o muy avanzado";
    }
    return "";
  }

  String getSumEP(int puntajeBrutoLocomotora, int puntajeBrutoPelota,
      int ageScore, String? gender) {
    int locomotoraEP =
        int.parse(getLocomotoraEP(puntajeBrutoLocomotora, ageScore));
    int pelotaEP = int.parse(getPelotaEP(puntajeBrutoPelota, ageScore, gender));

    int sumEP = locomotoraEP + pelotaEP;

    return sumEP.toString();
  }

  String getDifEP(int puntajeBrutoLocomotora, int puntajeBrutoPelota,
      int ageScore, String? gender) {
    int locomotoraEP =
        int.parse(getLocomotoraEP(puntajeBrutoLocomotora, ageScore));
    int pelotaEP = int.parse(getPelotaEP(puntajeBrutoPelota, ageScore, gender));

    int difEP = (locomotoraEP - pelotaEP).abs();

    return difEP.toString();
  }

  String getEstado(int puntajeBrutoLocomotora, int puntajeBrutoPelota,
      int ageScore, String? gender) {
    int locomotoraEP =
        int.parse(getLocomotoraEP(puntajeBrutoLocomotora, ageScore));
    int pelotaEP = int.parse(getPelotaEP(puntajeBrutoPelota, ageScore, gender));

    int differenceEP = (locomotoraEP - pelotaEP).abs();

    if (differenceEP >= 0 && differenceEP <= 2) {
      return "No importante";
    } else if (differenceEP >= 3 && differenceEP <= 5) {
      return "Estadística";
    } else if (differenceEP >= 6) {
      return "Clínico";
    }
    return "";
  }

  @override
  void initState() {
    super.initState();
    _locomotoraPBController =
        TextEditingController(text: widget.totalLocomotoraScore.toString());
    _locomotoraEQController = TextEditingController(
        text: getLocomotoraEQ(widget.totalLocomotoraScore));
    _locomotoraRPController = TextEditingController(
        text: getLocomotoraRP(widget.totalLocomotoraScore, widget.ageScore));
    _locomotoraEPController = TextEditingController(
        text: getLocomotoraEP(widget.totalLocomotoraScore, widget.ageScore));
    _locomotoraIC90Controller = TextEditingController(
        text: getLocomotoraIC90(widget.totalLocomotoraScore));
    _locomotoraIC95Controller = TextEditingController(
        text: getLocomotoraIC95(widget.totalLocomotoraScore));
    _locomotoraTDController = TextEditingController(
        text: getLocomotoraTD(widget.totalLocomotoraScore));
    _pelotaPBController =
        TextEditingController(text: widget.totalPelotaScore.toString());
    _pelotaEQController = TextEditingController(
        text: getPelotaEQ(widget.totalPelotaScore, widget.gender));
    _pelotaRPController = TextEditingController(
        text: getPelotaRP(
            widget.totalPelotaScore, widget.ageScore, widget.gender));
    _pelotaEPController = TextEditingController(
        text: getPelotaEP(
            widget.totalPelotaScore, widget.ageScore, widget.gender));
    _pelotaIC90Controller =
        TextEditingController(text: getPelotaIC90(widget.totalPelotaScore));
    _pelotaIC95Controller =
        TextEditingController(text: getPelotaIC95(widget.totalPelotaScore));
    _pelotaTDController =
        TextEditingController(text: getPelotaTD(widget.totalPelotaScore));
    _sumEPController = TextEditingController(
        text: getSumEP(widget.totalLocomotoraScore, widget.totalPelotaScore,
            widget.ageScore, widget.gender));
    _difEPController = TextEditingController(
        text: getDifEP(widget.totalLocomotoraScore, widget.totalPelotaScore,
            widget.ageScore, widget.gender));
    _estadoController = TextEditingController(
        text: getEstado(widget.totalLocomotoraScore, widget.totalPelotaScore,
            widget.ageScore, widget.gender));
  }

  @override
  void dispose() {
    _locomotoraPBController.dispose();
    _locomotoraEQController.dispose();
    _locomotoraRPController.dispose();
    _locomotoraEPController.dispose();
    _locomotoraIC90Controller.dispose();
    _locomotoraIC95Controller.dispose();
    _locomotoraTDController.dispose();
    _pelotaPBController.dispose();
    _pelotaEQController.dispose();
    _pelotaRPController.dispose();
    _pelotaEPController.dispose();
    _pelotaIC90Controller.dispose();
    _pelotaIC95Controller.dispose();
    _pelotaTDController.dispose();
    _sumEPController.dispose();
    _difEPController.dispose();
    _estadoController.dispose();
    super.dispose();
  }

// Función para guardar los resultados en la base de datos
  Future<void> guardarEvaluacion() async {
    final evaluacionData = {
      'idUser': widget.idUser.toString(),
      // Datos de Locomotora
      'locomotora_puntaje_bruto': widget.totalLocomotoraScore.toString(),
      'locomotora_edad_equivalente': _locomotoraEQController.text,
      'locomotora_rango_percentil': _locomotoraRPController.text,
      'locomotora_escala_puntaje': _locomotoraEPController.text,
      'locomotora_intervalo_confianza_90': _locomotoraIC90Controller.text,
      'locomotora_intervalo_confianza_95': _locomotoraIC95Controller.text,
      'locomotora_nivel_madurez': _locomotoraTDController.text,
      // Datos de Pelota
      'pelota_puntaje_bruto': widget.totalPelotaScore.toString(),
      'pelota_edad_equivalente': _pelotaEQController.text,
      'pelota_rango_percentil': _pelotaRPController.text,
      'pelota_escala_puntaje': _pelotaEPController.text,
      'pelota_intervalo_confianza_90': _pelotaIC90Controller.text,
      'pelota_intervalo_confianza_95': _pelotaIC95Controller.text,
      'pelota_nivel_madurez': _pelotaTDController.text,
      // Datos totales
      'suma_puntuaciones': _sumEPController.text,
      'diferencia_puntuaciones': _difEPController.text,
      'estado': _estadoController.text
    };

    print('Enviando datos de evaluación: $evaluacionData');

    final ApiService apiService = ApiService();
    final bool success = await apiService.saveEvaluacion(evaluacionData);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Evaluación guardada correctamente')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al guardar la evaluación')),
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
            Text('Sección 2', style: TextStyle(fontSize: 25)),
            Text('Rendimiento de las subpruebas',
                style: TextStyle(fontSize: 20)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
              const Text(
                'Subtest: Locomotora',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _locomotoraPBController,
                          decoration: const InputDecoration(
                              labelText: 'Puntaje Bruto',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _locomotoraEQController,
                          decoration: const InputDecoration(
                              labelText: 'Edad Equivalente',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _locomotoraRPController,
                          decoration: const InputDecoration(
                              labelText: 'Rango Percentil',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _locomotoraEPController,
                          decoration: const InputDecoration(
                              labelText: 'Escala de Puntaje',
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _locomotoraIC90Controller,
                          decoration: const InputDecoration(
                              labelText: '90%',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _locomotoraIC95Controller,
                          decoration: const InputDecoration(
                              labelText: '95%',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _locomotoraTDController,
                          decoration: const InputDecoration(
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
              const SizedBox(height: 25),
              const Text(
                'Subtest: Habilidades con pelota',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _pelotaPBController,
                          decoration: const InputDecoration(
                              labelText: 'Puntaje Bruto',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _pelotaEQController,
                          decoration: const InputDecoration(
                              labelText: 'Edad Equivalente',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _pelotaRPController,
                          decoration: const InputDecoration(
                              labelText: 'Rango Percentil',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _pelotaEPController,
                          decoration: const InputDecoration(
                              labelText: 'Escala de Puntaje',
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _pelotaIC90Controller,
                          decoration: const InputDecoration(
                              labelText: '90%',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _pelotaIC95Controller,
                          decoration: const InputDecoration(
                              labelText: '95%',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _pelotaTDController,
                          decoration: const InputDecoration(
                              labelText: 'Término Descriptivo',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _sumEPController,
                          decoration: const InputDecoration(
                              labelText: 'Suma de los puntajes escalado',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _difEPController,
                          decoration: const InputDecoration(
                              labelText: 'Diferencia entre puntajes escalados',
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _estadoController,
                          decoration: const InputDecoration(
                              labelText: 'Estado',
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
                    // Primero guardamos la evaluación
                    await guardarEvaluacion();

                    // Luego navegamos a la siguiente sección
                    if (mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Section3Screen(
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
                            sumEP: int.parse(getSumEP(
                                widget.totalLocomotoraScore,
                                widget.totalPelotaScore,
                                widget.ageScore,
                                widget.gender)),
                            ageScore: widget.ageScore,
                          ),
                        ),
                      );
                    }
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
              ))
            ],
          ),
        ),
      ),
    );
  }
}
