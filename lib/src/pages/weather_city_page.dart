import 'package:flutter/material.dart';
import 'package:flutter_basics/src/models/city_model.dart';
import 'package:flutter_basics/src/providers/weather_provider.dart';

class WeatherCityPage extends StatelessWidget {
  final PageController _pageController = PageController();
  WeatherCityPage({Key key});

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pageOne(arguments),
          _pageTwo(
            context,
          )
        ],
      ),
    );
  }

  Widget _pageOne(arguments) {
    return Stack(
      children: <Widget>[
        _background(arguments["img"], arguments["query"]),
        _pageOneContent(arguments["query"])
      ],
    );
  }

  Widget _pageTwo(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey[850],
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 60,
              icon: Icon(
                Icons.keyboard_arrow_up,
              ),
              onPressed: () {
                _pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                );
              },
            ),
            Expanded(
              child: Center(
                child: MaterialButton(
                  color: Colors.purple[700],
                  child: Text("Back"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _background(String img, String tagHero) {
    return Hero(
      tag: tagHero,
      child: Opacity(
        opacity: 0.8,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/cities/$img.jpg"), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  Widget _pageOneContent(String cityName) {
    WeatherProvider weatherProvider = WeatherProvider();

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: weatherProvider.getCityWeather(cityName),
          builder: (BuildContext context, AsyncSnapshot<CityWeather> snapshot) {
            final cityData = snapshot.data;
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(image: NetworkImage(cityData.getIcon())),
                      Text(
                        "${cityData.temp.toString()}°",
                        style: TextStyle(
                          fontSize: 60.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    cityData.description.capitalize(),
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    cityData.getName(),
                    style: TextStyle(
                      fontSize: 23.0,
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    iconSize: 60,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    onPressed: () {
                      _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  SizedBox(height: 30.0),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
