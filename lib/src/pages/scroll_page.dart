import 'package:flutter/material.dart';
import 'package:flutter_basics/src/data/cities.dart';

// ignore: must_be_immutable
class ScrollPage extends StatelessWidget {
  String pageTitle;
  ScrollPage({Key key, this.pageTitle = "Sroll"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800],
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text("Climate of cities: México"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _printCities(context),
        ),
      ),
    );
  }

  Widget _cityTile(city, BuildContext context) {
    final cityTile = Container(
      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 15.0),
      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: Colors.black54,
        image: DecorationImage(
          image: AssetImage("assets/cities/${city["img"]}.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.white38, BlendMode.lighten),
        ),
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            city["name"],
            style: TextStyle(
              color: Colors.purple[700],
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          )
        ],
      ),
    );

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "weather_city", arguments: city);
      },
      child: cityTile,
    );
  }

  List<Widget> _printCities(BuildContext context) {
    List<Widget> citiesToPrint = List();

    cities.forEach((element) {
      citiesToPrint.add(_cityTile(element, context));
    });

    citiesToPrint.add(SizedBox(height: 20.0));

    return citiesToPrint;
  }
}
