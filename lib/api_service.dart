import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://rocket.piapp.online';
  static const Duration _timeout = Duration(seconds: 30);

  // Método para guardar institución y obtener el ID generado
  Future<int?> saveInstitution(String institutionName) async {
    final String endpoint = '$_baseUrl/guardar_institucion.php';

    try {
      final response = await http
          .post(
            Uri.parse(endpoint),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'institutionName': institutionName}),
          )
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          return jsonResponse['idInstitution'];
        }
      }
      print(
          'Error en saveInstitution - Status: ${response.statusCode}, Body: ${response.body}');
    } catch (e) {
      print('Error en saveInstitution: $e');
    }

    return null;
  }

  // Método para guardar examinador y obtener el ID generado
  Future<int?> saveExaminer(String examinerName, String examinerTitle) async {
    final String endpoint = '$_baseUrl/guardar_examinador.php';

    try {
      final response = await http
          .post(
            Uri.parse(endpoint),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(
                {'examinerName': examinerName, 'examinerTitle': examinerTitle}),
          )
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          return jsonResponse['idExaminador'];
        }
      }
      print(
          'Error en saveExaminer - Status: ${response.statusCode}, Body: ${response.body}');
    } catch (e) {
      print('Error en saveExaminer: $e');
    }

    return null;
  }

  // Método para guardar usuario usando los IDs de institución y examinador
  Future<int?> saveUser(Map<String, dynamic> userData) async {
    final String endpoint = '$_baseUrl/guardar_usuario.php';

    try {
      final response = await http
          .post(
            Uri.parse(endpoint),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(userData),
          )
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          return jsonResponse['idUser'];
        }
      }
      print(
          'Error en saveUser - Status: ${response.statusCode}, Body: ${response.body}');
    } catch (e) {
      print('Error en saveUser: $e');
    }

    return null;
  }

  // Método para guardar datos adicionales
  Future<bool> saveDatos(
      String preferredHand, String preferredFoot, int userId) async {
    final String endpoint = '$_baseUrl/guardar_datos.php';

    try {
      final response = await http
          .post(
            Uri.parse(endpoint),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'preferredHand': preferredHand,
              'preferredFoot': preferredFoot,
              'userId': userId
            }),
          )
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse['status'] == 'success';
      }
      print(
          'Error en saveDatos - Status: ${response.statusCode}, Body: ${response.body}');
    } catch (e) {
      print('Error en saveDatos: $e');
    }

    return false;
  }

  // Método para obtener registros
  Future<List<dynamic>> getRecords() async {
    final String endpoint = '$_baseUrl/get_records.php';
    try {
      final response = await http.get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse['records'] ?? [];
      } else {
        print('Error al obtener registros: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }

    return [];
  }

  // Método para eliminar un registro por ID
  Future<bool> deleteRecord(int idUser) async {
    final String endpoint = '$_baseUrl/delete_record.php';

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        body: {'idUser': idUser.toString()},
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print('Respuesta del servidor: $jsonResponse'); // Para depurar
        return jsonResponse['status'] == 'success';
      } else {
        // Se corrigió la estructura del bloque if
        print(
            'Error al eliminar registro: Código de estado ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }

    return false; // Devuelve false si hubo un error
  }

  Future<bool> saveTestResults(
      int userId, List<Map<String, dynamic>> testResults) async {
    final String endpoint = '$_baseUrl/guardar_test_results.php';

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'user_idUser': userId,
          'testResults': testResults, // Enviamos la lista de secciones
        }),
      );

      print("Respuesta del servidor: ${response.body}");

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse['status'] == 'success';
      }
    } catch (e) {
      print('Error al guardar los resultados del test: $e');
    }

    return false;
  }

  Future<Map<String, dynamic>> getRecordDetails(int idUser) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/get_records_details.php'), // ✅ URL correcta
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'idUser': idUser}), // ✅ Envía el ID en JSON
    );

    print(
        "Respuesta de getRecordDetails para ID $idUser: ${response.body}"); // 🔍 Depuración

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['record']; // ✅ Devuelve solo los datos del registro
    } else {
      throw Exception('Error al cargar los detalles del registro');
    }
  }

  Future<int?> getLastUserId() async {
    final String endpoint = '$_baseUrl/get_last_user.php';

    try {
      final response = await http.get(
        Uri.parse(endpoint),
        headers: {'Accept': 'application/json'},
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          return data['idUser'];
        }
      }
    } catch (e) {
      print('Error al obtener último usuario: $e');
    }
    return null;
  }

  Future<bool> saveEvaluacion(Map<String, dynamic> evaluacionData) async {
    try {
      print('URL: $_baseUrl/guardar_evaluacion.php');

      // Obtener el ID del último usuario
      final lastUserId = await getLastUserId();
      if (lastUserId == null) {
        print('Error: No se pudo obtener el ID del último usuario');
        return false;
      }

      // Asegurarnos que todos los valores sean strings antes de enviar
      final dataToSend = {
        ...evaluacionData,
        'idUser': lastUserId.toString() // Convertir el ID a string
      };

      print('Datos a enviar: $dataToSend');

      final response = await http.post(
        Uri.parse('$_baseUrl/guardar_evaluacion.php'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        },
        body: Uri(queryParameters: dataToSend).query,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          print('Evaluación guardada exitosamente');
          return true;
        } else {
          print('Error del servidor: ${data['message']}');
          return false;
        }
      } else {
        print('Error HTTP: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e, stackTrace) {
      print('Error al guardar evaluación: $e');
      print('Stack trace: $stackTrace');
      return false;
    }
  }

  Future<bool> saveMotricidadGruesa(Map<String, dynamic> data) async {
    try {
      print('URL: $_baseUrl/guardar_motricidad.php');

      // Obtener el ID del último usuario
      final lastUserId = await getLastUserId();
      if (lastUserId == null) {
        print('Error: No se pudo obtener el ID del último usuario');
        return false;
      }

      // Preparar los datos para enviar
      final dataToSend = {
        'idUser': lastUserId.toString(),
        'suma_puntuaciones_escaladas': data['suma_puntuaciones_escaladas'],
        'rango_percentil': data['rango_percentil'],
        'indice_motor_gruesa': data['indice_motor_gruesa'],
        'intervalo_confianza_90': data['intervalo_confianza_90'],
        'intervalo_confianza_95': data['intervalo_confianza_95'],
        'termino_descriptivo': data['termino_descriptivo'],
      };

      print('Datos a enviar: $dataToSend');

      final response = await http.post(
        Uri.parse('$_baseUrl/guardar_motricidad.php'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        },
        body: dataToSend,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success') {
          print('Datos de motricidad guardados exitosamente');
          return true;
        } else {
          print('Error del servidor: ${responseData['message']}');
          return false;
        }
      } else {
        print('Error HTTP: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e, stackTrace) {
      print('Error al guardar datos de motricidad: $e');
      print('Stack trace: $stackTrace');
      return false;
    }
  }
}
