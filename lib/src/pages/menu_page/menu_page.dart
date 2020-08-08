import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:flutter_basics/src/pages/menu_page/menu_items.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // create button to render
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
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
            ),
          ],
        ),
        // create pages switch
        // ignore: missing_return
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                // ref to menu list width, gradients
                builder: (BuildContext context) => MenuItems(),
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
