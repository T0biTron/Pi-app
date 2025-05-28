import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_service.dart';
import 'record_detail_screen.dart';
import 'package:http/http.dart' as http;
import 'package:excel/excel.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  _RecordsScreenState createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  List<Map<String, dynamic>> records = [];
  final ApiService apiService = ApiService();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    fetchRecords();
  }

  // Función para obtener la lista de usuarios desde la API
  Future<void> fetchRecords() async {
    final List<dynamic> fetchedRecords = await apiService.getRecords();

    setState(() {
      records = fetchedRecords.cast<Map<String, dynamic>>();
    });
  }

  // Eliminar registro
  void deleteRecord(int idUser, int index) async {
    setState(() {
      records[index]['isDeleting'] = true;
    });

    bool isDeleted = await apiService.deleteRecord(idUser);

    if (isDeleted) {
      _listKey.currentState?.removeItem(
        index,
        (context, animation) => _buildListItem(records[index], animation),
        duration: Duration(milliseconds: 300),
      );
      await Future.delayed(Duration(milliseconds: 300));
      setState(() {
        records.removeAt(index);
      });
    } else {
      setState(() {
        records[index]['isDeleting'] = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al eliminar el registro.'),
        ),
      );
    }
  }

  // Función para exportar todos los registros en formato Excel
  Future<void> generarExcelDesdeAPI() async {
    try {
      // Request permissions
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.manageExternalStorage,
      ].request();

      if (!statuses.values.every((status) => status.isGranted)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ Se requieren permisos de almacenamiento")),
        );
        return;
      }

      final response = await http.get(
        Uri.parse("https://rocket.piapp.online/get_all_details.php"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] != 'success') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${data['message']}")),
          );
          return;
        }

        List registros = data['records'];
        var excel = Excel.createExcel();
        Sheet sheet = excel['Análisis Datos'];

        // Headers para datos básicos y evaluaciones
        sheet.appendRow([
          // Datos básicos del usuario
          "Nombre",
          "Género",
          "Fecha Nacimiento",
          "Fecha Prueba",
          "Edad (años)",
          "Mano Preferida",
          "Pie Preferido",
          "Institución",
          "Examinador",
          "Título del Examinador",
          // Datos de Locomotora
          "Puntaje Bruto Locomotora",
          "Edad Equivalente Locomotora",
          "Rango Percentil Locomotora",
          "Escala Puntaje Locomotora",
          "IC 90% Locomotora",
          "IC 95% Locomotora",
          "Nivel Madurez Locomotora",
          // Datos de Pelota
          "Puntaje Bruto Pelota",
          "Edad Equivalente Pelota",
          "Rango Percentil Pelota",
          "Escala Puntaje Pelota",
          "IC 90% Pelota",
          "IC 95% Pelota",
          "Nivel Madurez Pelota",
          // Datos de evaluación total
          "Suma Puntuaciones",
          "Diferencia Puntuaciones",
          "Estado",
          // Datos de Motricidad Gruesa
          "Suma Puntuaciones Escaladas",
          "Rango Percentil MG",
          "Índice Motor Gruesa",
          "IC 90% MG",
          "IC 95% MG",
          "Término Descriptivo MG"
        ]);

        for (var r in registros) {
          DateTime nacimiento = DateTime.parse(r['birthdate']);
          DateTime prueba = DateTime.parse(r['testDate']);
          int edad = prueba.difference(nacimiento).inDays ~/ 365;

          sheet.appendRow([
            // Datos básicos del usuario
            r['name'],
            r['gender'],
            r['birthdate'],
            r['testDate'],
            edad,
            r['preferredHand'],
            r['preferredFoot'],
            r['institution'],
            r['examinerName'],
            r['examinerTitle'],
            // Datos de Locomotora
            r['locomotora_puntaje_bruto'] ?? '',
            r['locomotora_edad_equivalente'] ?? '',
            r['locomotora_rango_percentil'] ?? '',
            r['locomotora_escala_puntaje'] ?? '',
            r['locomotora_intervalo_confianza_90'] ?? '',
            r['locomotora_intervalo_confianza_95'] ?? '',
            r['locomotora_nivel_madurez'] ?? '',
            // Datos de Pelota
            r['pelota_puntaje_bruto'] ?? '',
            r['pelota_edad_equivalente'] ?? '',
            r['pelota_rango_percentil'] ?? '',
            r['pelota_escala_puntaje'] ?? '',
            r['pelota_intervalo_confianza_90'] ?? '',
            r['pelota_intervalo_confianza_95'] ?? '',
            r['pelota_nivel_madurez'] ?? '',
            // Datos de evaluación total
            r['suma_puntuaciones'] ?? '',
            r['diferencia_puntuaciones'] ?? '',
            r['estado'] ?? '',
            // Datos de Motricidad Gruesa
            r['suma_puntuaciones_escaladas'] ?? '',
            r['rango_percentil'] ?? '',
            r['indice_motor_gruesa'] ?? '',
            r['intervalo_confianza_90'] ?? '',
            r['intervalo_confianza_95'] ?? '',
            r['termino_descriptivo'] ?? ''
          ]);
        }

        // Permitir al usuario seleccionar dónde guardar el archivo
        String? selectedDirectory = await FilePicker.platform.getDirectoryPath(
          dialogTitle: 'Selecciona dónde guardar el archivo Excel',
        );

        if (selectedDirectory == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("❌ No se seleccionó ninguna ubicación")),
          );
          return;
        }

        final String fileName =
            'tgmd3_analisis_datos_${DateTime.now().millisecondsSinceEpoch}.xlsx';
        final String filePath = '$selectedDirectory/$fileName';
        final file = File(filePath);

        await file.writeAsBytes(excel.encode()!);

        // Mostrar diálogo de éxito con la ubicación
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Excel Generado'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('El archivo se guardó exitosamente en:'),
                  SizedBox(height: 8),
                  Text(
                    filePath,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await Share.shareXFiles([XFile(file.path)],
                        text: 'TGMD-3 - Análisis de datos');
                  },
                  child: Text('Compartir'),
                ),
              ],
            );
          },
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ Error al conectar con la API")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registros'),
      ),
      body: records.isEmpty
          ? Center(
              child: Text(
                'No existen registros',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : AnimatedList(
              key: _listKey,
              initialItemCount: records.length,
              itemBuilder: (context, index, animation) {
                return _buildListItem(records[index], animation);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: generarExcelDesdeAPI,
        icon: Icon(Icons.download),
        label: Text("Exportar Excel"),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildListItem(
      Map<String, dynamic> record, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      axisAlignment: 0.0,
      child: ListTile(
        title: Text(record['name']),
        subtitle: Text(
          'Género: ${record['gender']}, Edad: ${record['age']} años',
        ),
        trailing: record['isDeleting'] == true
            ? CircularProgressIndicator()
            : IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  deleteRecord(int.parse(record['idUser'].toString()),
                      records.indexOf(record));
                },
              ),
        onTap: () async {
          int idUser = int.parse(record['idUser'].toString());

          final detalles = await apiService.getRecordDetails(idUser);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecordDetailScreen(record: detalles),
            ),
          );
        },
      ),
    );
  }
}
