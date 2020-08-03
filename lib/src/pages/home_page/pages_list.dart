import 'package:flutter/material.dart';

class PagesList extends StatelessWidget {
  final List itemsList = [
    {
      "name": "Basic view",
      "route": "basic",
      "params": {"placeId": 1},
      "icon": Icons.crop_square,
      "color": Colors.blueGrey[50]
    },
    {
      "name": "Scroll view",
      "route": "scroll",
      "icon": Icons.file_download,
      "color": Colors.blueAccent
    },
    {
      "name": "Awesome menu",
      "route": "menu",
      "icon": Icons.list,
      "color": Colors.amber
    },
    {
      "name": "Error page",
      "route": "error",
      "icon": Icons.bug_report,
      "color": Colors.red
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: _generateList(context),
    );
  }

  Widget _generateTile(item, BuildContext context) {
    return ListTile(
      leading: Icon(item["icon"], color: item["color"]),
      trailing: Icon(Icons.navigate_next, color: item["color"]),
      title: Text(
        item["name"],
        style: TextStyle(color: item["color"]),
      ),
      onTap: () {
        Navigator.pushNamed(context, item["route"], arguments: item["params"]);
      },
    );
  }

  List<Widget> _generateList(BuildContext context) {
    List<Widget> listItems = List();

    itemsList.forEach((item) {
      listItems.add(_generateTile(item, context));
    });

    return listItems.toList();
  }
}
