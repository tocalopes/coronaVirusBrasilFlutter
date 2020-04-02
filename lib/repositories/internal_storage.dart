import 'dart:convert';
import 'dart:io';
import 'package:corona_app/services/coronaApi.dart';
import 'package:path_provider/path_provider.dart';

class InternalStorage {

  final CoronaApi api = CoronaApi();

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> updateData(String response) async {
    String data = await jsonEncode(api.updateData());
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> readData() async {
    try {
      final file = await _getFile();
      return file.readAsStringSync();
    } catch (e) {
      return null;
    }
  }

}