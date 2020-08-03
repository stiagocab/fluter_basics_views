import 'package:flutter/material.dart';
import 'package:flutter_basics/src/pages/home_page/pages_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: PagesList(),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple[900],
            ),
            child: PagesList(),
          ),
        ),
      ),
    );
  }
}
