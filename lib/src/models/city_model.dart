extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class CityWeather {
  double temp, tempMin, tempMax; // temps
  int humidity, pressure; // temps
  double windSpeed; // wind
  String city, country, description, icon;
  Coords coord;

  CityWeather({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.humidity,
    this.pressure,
    this.city,
    this.country,
    this.description,
    this.icon,
    this.windSpeed,
    this.coord,
  });

  CityWeather.fromJson(Map<String, dynamic> json) {
    final main = json["main"];
    final weather = json["weather"];
    final wind = json["wind"];
    final coords = json["coord"];

    temp = main["temp"] / 1;
    tempMin = main["temp_min"] / 1;
    tempMax = main["temp_max"] / 1;
    humidity = main["humidity"];
    pressure = main["pressure"];
    description = weather["description"];
    icon = weather["icon"];
    windSpeed = wind["speed"];
    city = json["name"];
    country = json["sys"]["country"];
    coord = Coords(latitude: coords["lat"], longitude: coords["lon"]);
  }

  getIcon() {
    // icon to the current wheater
    return "http://openweathermap.org/img/w/$icon.png";
  }

  getName() {
    // city name like => London, UK; Mexico, MX
    return "${city.capitalize()}, $country";
  }
}

class Coords {
  double latitude, longitude;
  Coords({this.latitude, this.longitude});
}
