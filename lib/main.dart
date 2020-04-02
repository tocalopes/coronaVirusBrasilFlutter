import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:corona_app/repositories/internal_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/brasil.dart';

void main() async {
  runApp(
      MaterialApp(
        home: Myapp(),
      )
  );
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  Brasil _brasil = Brasil.vazio();
  InternalStorage storage = InternalStorage();

  void load(){
    setState(() {
      storage.readData().then((data){
        var test = jsonDecode(data);
        _brasil = Brasil(jsonDecode(test));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    storage.readData().then((data){
      var test = jsonDecode(data);
      _brasil = Brasil(jsonDecode(test));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Corona Virus"),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: (){
                storage.updateData;
                load();
            }
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            DataTable(
              columns: [
                DataColumn(label: Text("")),
                DataColumn(label: Text("")),
              ],
              rows: [
                DataRow(cells:[
                  DataCell(Text("Pais",style: TextStyle(fontSize: 17.0))),
                  DataCell(Text("${_brasil.country}",style: TextStyle(fontSize: 17.0))),
                ]),
                DataRow(cells:[
                  DataCell(Text("Confirmados",style: TextStyle(color: Colors.red,fontSize: 17.0),)),
                  DataCell(Text("${_brasil.confirmed}",style: TextStyle(color: Colors.red,fontSize: 17.0),)),
                ]),
                DataRow(cells:[
                  DataCell(Text("Mortos:",style: TextStyle(fontSize: 17.0))),
                  DataCell(Text("${_brasil.deaths}",style: TextStyle(fontSize: 17.0))),
                ]),
                DataRow(cells:[
                  DataCell(Text("Recuperados:",style: TextStyle(fontSize: 17.0))),
                  DataCell(Text("${_brasil.recovered}",style: TextStyle(fontSize: 17.0))),
                ]),
                DataRow(cells:[
                  DataCell(Text("Última atualização:",style: TextStyle(fontSize: 17.0))),
                  DataCell(Text("${_brasil.lastUpdate}",style: TextStyle(fontSize: 17.0))),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget buildInfo(String field,String info){
  return Text("$field : $info", style: TextStyle(
    fontSize: 25.0,
    color: Colors.green,
  ),);
}





