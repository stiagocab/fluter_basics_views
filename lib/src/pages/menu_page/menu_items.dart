import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';

class MenuItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // page stack, backround and content list items
    return Stack(
      // alignment: Alignment(0.0, -0.2),
      children: <Widget>[
        _createBackground(),
        SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50.0),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "HOME PAGE",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Select an option to init",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              SafeArea(child: _createMenuItemsTable()),
            ],
          ),
        ),
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
              angle: -pi / 2.30,
              child: Container(
                height: 380.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(136, 210, 226, 0.7),
                      Color.fromRGBO(214, 103, 191, 0.5),
                      // Color.fromRGBO(214, 103, 191, 0.0),
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

  Widget _createMenuItemsTable() {
    // list of table rows
    final List<TableRow> tableRowItems = List();

    menuList.forEach((row) {
      // list of items on table row
      final List<Widget> tableColsItems = List();
      row.forEach((element) {
        // add button on tableRow
        tableColsItems.add(_buttonMenuItem(element));
      });
      // add tableRow
      tableRowItems.add(TableRow(children: tableColsItems));
    });

    return Table(
      // add table row to table
      children: tableRowItems,
    );
  }

  Widget _buttonMenuItem(menuItem) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: menuItem["color"],
                radius: 35.0,
                child: Icon(menuItem["icon"], color: Colors.white, size: 30.0),
              ),
              SizedBox(height: 20.0),
              Text(
                menuItem["name"],
                style: TextStyle(
                  color: menuItem["color"],
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List menuList = [
  [
    {
      "name": "General",
      "icon": Icons.dashboard,
      "color": Colors.lightBlueAccent
    },
    {
      "name": "Transport",
      "icon": Icons.directions_bus,
      "color": Colors.purpleAccent
    }
  ],
  [
    {"name": "Proyects", "icon": Icons.work, "color": Colors.pinkAccent},
    {"name": "Bills", "icon": Icons.credit_card, "color": Colors.orange},
  ],
  [
    {"name": "Enterteiment", "icon": Icons.movie, "color": Colors.blueAccent},
    {
      "name": "Grocery",
      "icon": Icons.local_grocery_store,
      "color": Colors.greenAccent
    }
  ],
  [
    {"name": "Settings", "icon": Icons.settings, "color": Colors.lime},
    {"name": "Money", "icon": Icons.monetization_on, "color": Colors.amber}
  ]
];
