import 'package:flutter/material.dart';

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
}

// ignore: must_be_immutable
class ErrorPage extends StatelessWidget {
  String pageTitle;
  ErrorPage({Key key, this.pageTitle = "Error page"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red[900],
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "ERROR!",
                style: TextStyle(
                    color: Colors.redAccent[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0),
                textAlign: TextAlign.center,
              ),
              Text(
                '"${pageTitle.inCaps}" no existe',
                style: TextStyle(
                  color: Colors.redAccent[400],
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
