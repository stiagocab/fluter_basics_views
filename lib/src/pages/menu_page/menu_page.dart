import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class MenuItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _createBackground(),
      ],
    );
  }

  Widget _createBackground() {
    return Container(
      // background page
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red,
        gradient: LinearGradient(
          // colors: [Color(0x14B5D6), Color(0x090979)],
          colors: [Color(0xFF584CD1), Colors.blueAccent[700]],
          begin: FractionalOffset(0.3, 0.2),
          end: FractionalOffset(0.5, 1.0),
        ),
      ),
      child: Stack(
        children: <Widget>[
          // box on top, background pink
          Transform.translate(
            offset: const Offset(0.0, -100.0),
            child: Transform.rotate(
              angle: -pi / 5.0,
              child: Container(
                height: 350.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(136, 210, 226, 0.5),
                      Color.fromRGBO(214, 103, 191, 0.5),
                    ],
                    begin: FractionalOffset(0.3, 0.2),
                    end: FractionalOffset(0.5, 1.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.black45,
          activeColor: Color.fromRGBO(214, 103, 191, 1.0),
          inactiveColor: Color.fromRGBO(136, 210, 226, 1.0),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)
                  ),
                  color: Colors.blueAccent[700],
                ),
                // color: Colors.red,
                child: Icon(
                  Icons.search,
                  color: Color.fromRGBO(214, 103, 191, 1.0),
                  size: 35.0,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => MenuItemsPage(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => Center(
                  child: Text("Search"),
                ),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) => Center(
                  child: Text("Profile"),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}
