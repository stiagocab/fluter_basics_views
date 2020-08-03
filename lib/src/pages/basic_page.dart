import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BasicPage extends StatelessWidget {
  String pageTitle;
  BasicPage({Key key, this.pageTitle = "HI"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(pageTitle),
      ),
    );
  }
}
