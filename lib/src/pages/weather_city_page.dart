import 'package:flutter/material.dart';

class WeatherCityPage extends StatelessWidget {
  const WeatherCityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = ModalRoute.of(context).settings.arguments;
    print(arguments);
    return Scaffold(
      body: Center(
        child: Text(arguments["name"]),
      ),
    );
  }
}
