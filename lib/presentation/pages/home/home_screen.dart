import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hdfcTestApp/data/model/list_brewerie_model.dart';
import 'package:hdfcTestApp/presentation/pages/BreweriesList/Breweries_list_screen.dart';
import 'dart:js' as js;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () async {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BreweriesListScreen()));
            },
            child: Text("Login"),
          ),
        ),
      ),
    );
  }
}
