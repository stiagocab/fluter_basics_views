import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScrollPage extends StatelessWidget {
  String pageTitle;
  ScrollPage({Key key, this.pageTitle = "Sroll"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(pageTitle),
      ),
    );
  }
}
