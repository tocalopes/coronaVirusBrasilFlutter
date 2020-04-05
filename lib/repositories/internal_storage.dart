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

  void updateData() async {
    String data = jsonEncode(await api.updateData());
    print(data);
    final file = await _getFile();
    file.writeAsString(data);
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