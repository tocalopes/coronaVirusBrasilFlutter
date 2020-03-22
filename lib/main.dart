import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  runApp(
      MaterialApp(
        home: Myapp(),
      )
  );
}

Future<Map> getData() async {
  final response = await http.get(
    'https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/stats?country=Brazil',
    headers: {"x-rapidapi-host" : "covid-19-coronavirus-statistics.p.rapidapi.com",
      "x-rapidapi-key": "1fce8bb448msh9f8ab63696ca9f0p1ccd4ajsn69f8f8834355"},
  );
  return json.decode(response.body);
}


class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  String country;
  String lastUpdate;
  String confirmed;
  String deaths;
  String recovered;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Corona Virus"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                  child: Text(
                    "carregando dados",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.center,
                  ));
            default:
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                      "Falha ao carregar dados :/",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                      ),
                      textAlign: TextAlign.center,
                    ));
              } else {

                country = snapshot.data["data"]["covid19Stats"][0]["country"];
                lastUpdate = snapshot.data["data"]["covid19Stats"][0]["lastUpdate"].toString();
                confirmed = snapshot.data["data"]["covid19Stats"][0]["confirmed"].toString();
                deaths = snapshot.data["data"]["covid19Stats"][0]["deaths"].toString();
                recovered = snapshot.data["data"]["covid19Stats"][0]["recovered"].toString();

                return SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(Icons.help_outline,
                          size: 150.0, color: Colors.green),
                      Text("Pais: $country",style:TextStyle(
                        fontSize: 25.0,
                        color: Colors.green,
                      )),
                      Text("caso confirmados: $confirmed",style:TextStyle(
                        fontSize: 25.0,
                        color: Colors.green,
                      )),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
