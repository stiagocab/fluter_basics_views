import 'package:flutter_basics/src/models/city_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherProvider {
  final String _apiKey = "63fbd8d624c248e46dd9bbb3f5790341";
  final String _apiUrl = "api.openweathermap.org"; // ?q={city},mx&appid=apiKey

  Future<CityWeather> getCityWeather(String cityName) async {
    final url = Uri.https(
      _apiUrl,
      "data/2.5/weather",
      {
        "q": cityName,
        'appid': _apiKey,
      },
    );
    // get method
    final resp = await http.get(url);
    // final resp = await http.get(url);
    // decoded
    final decodedData = json.decode(resp.body);
    // decoded data to class
    final data = CityWeather.fromJson(decodedData);
    return data; // return data
  }
}
