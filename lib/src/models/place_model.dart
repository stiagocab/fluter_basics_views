import 'dart:math';

class Places {
  List<Place> items = List();

  Places();

  Places.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final movie = Place.mapFromJson(item);
      items.add(movie);
    }
  }
}

class Place {
  String name;
  String description;
  String country;
  String uniqueId;
  List<String> images;
  double rate;
  int id;
  double visits;

  Place({
    this.name,
    this.description,
    this.images,
    this.rate,
    this.country,
    this.visits,
  });

  Place.mapFromJson(Map<String, dynamic> json) {
    name = json["name"];
    description = json["description"];
    images = json["images"];
    rate = json["rate"] / 1;
    country = json["country"];
    visits = json["visits"] / 1;
    id = json["id"];
  }

  getRandomImage() {
    final max = images.length - 1;
    final random = Random();
    return images[random.nextInt(max)];
  }
}
