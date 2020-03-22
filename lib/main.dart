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
  fetchAlbum();
  runApp(
      MaterialApp(
        home: Container(),
      )
  );
}

Future<Map> getData() async {
  final response = await http.get(
    'https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/stats?country=Brazil',
    headers: {"x-rapidapi-host" : "covid-19-coronavirus-statistics.p.rapidapi.com",
      "x-rapidapi-key": "1fce8bb448msh9f8ab63696ca9f0p1ccd4ajsn69f8f8834355"},
  );
  Map responseJson = json.decode(response.body);
  return responseJson;
}




class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


/*class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}*/
