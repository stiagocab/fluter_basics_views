import 'package:flutter_basics/src/models/city_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherProvider {
  final String _apiKey = "63fbd8d624c248e46dd9bbb3f5790341";
  final String _apiUrl =
      "api.openweathermap.org/data/2.5/weather"; // ?q={city},mx&appid=apiKey

  Future<CityWeather> getCityWeather(String cityName) async {
    // query params
    final url = Uri.https(_apiUrl, "", {"q": cityName, 'apiKey': _apiKey});
    // get method
    final resp = await http.get(url);
    // decoded
    final decodedData = json.decode(resp.body);
    // decoded data to class
    final data = CityWeather.fromJson(decodedData);
    return data; // return data
  }
}
