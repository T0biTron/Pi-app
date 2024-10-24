import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_service.dart';
import 'record_detail_screen.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({Key? key}) : super(key: key);

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

  Future<void> fetchRecords() async {
    final List<dynamic> fetchedRecords = await apiService.getRecords();
    setState(() {
      records = fetchedRecords.cast<Map<String, dynamic>>();
    });
  }

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
      // Espera a que la animación termine antes de eliminar el elemento de la lista
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registros'),
      ),
      body: records.isEmpty
          ? Center(child: CircularProgressIndicator())
          : AnimatedList(
              key: _listKey,
              initialItemCount: records.length,
              itemBuilder: (context, index, animation) {
                return _buildListItem(records[index], animation);
              },
            ),
    );
  }

  Widget _buildListItem(Map<String, dynamic> record, Animation<double> animation) {
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
                  deleteRecord(int.parse(record['idUser'].toString()), records.indexOf(record));
                },
              ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecordDetailScreen(record: record),
            ),
          );
        },
      ),
    );
  }
}
