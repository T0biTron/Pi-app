import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://rocket.piapp.online'; // Cambia por tu URL real

  // Método para guardar institución y obtener el ID generado
  Future<int?> saveInstitution(String institutionName) async {
    final String endpoint = '$_baseUrl/guardar_institucion.php';
    
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'institutionName': institutionName}),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          return jsonResponse['idInstitution']; // Devuelve el ID generado
        }
      }
    } catch (e) {
      print('Error: $e');
    }
    
    return null; // Si hubo un error o no se generó correctamente
  }

  // Método para guardar examinador y obtener el ID generado
  Future<int?> saveExaminer(String examinerName, String examinerTitle) async {
    final String endpoint = '$_baseUrl/guardar_examinador.php';
    
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'examinerName': examinerName,
          'examinerTitle': examinerTitle
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          return jsonResponse['idExaminador']; // Devuelve el ID generado
        }
      }
    } catch (e) {
      print('Error: $e');
    }
    
    return null;
  }

  // Método para guardar usuario usando los IDs de institución y examinador
  Future<int?> saveUser(Map<String, dynamic> userData) async {
    final String endpoint = '$_baseUrl/guardar_usuario.php';
    
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          return jsonResponse['idUser']; // Devuelve el ID generado del usuario
        }
      }
    } catch (e) {
      print('Error: $e');
    }
    
    return null;
  }

  // Método para guardar datos adicionales
  Future<bool> saveDatos(String preferredHand, String preferredFoot, int userId) async {
    final String endpoint = '$_baseUrl/guardar_datos.php';
    
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'preferredHand': preferredHand,
          'preferredFoot': preferredFoot,
          'userId': userId
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse['status'] == 'success';
      }
    } catch (e) {
      print('Error: $e');
    }

    return false; // Devuelve false si hubo un error
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
        
      } else { // Se corrigió la estructura del bloque if
        print('Error al eliminar registro: Código de estado ${response.statusCode}');
      }
      
    } catch (e) {
      print('Error: $e');
    }

    return false; // Devuelve false si hubo un error
  }
}
