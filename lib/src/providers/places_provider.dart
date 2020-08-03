import 'package:flutter_basics/src/models/place_model.dart';

class PlacesProvider {
  List<Place> listPlaces;

  Future<List<Place>> getPlaces() async {
    final allPlaces = Places.fromJsonList(placesJson);
    return allPlaces.items;
  }

  Future<List<Place>> getFiltered(int placeId) async {
    final allPlaces = Places.fromJsonList(placesJson);
    return allPlaces.items.where((element) => element.id != placeId).toList();
  }

  Future<Place> getPlaceById(int placeId) async {
    final itemById =
        placesJson.where((element) => element["id"] == placeId).toList()[0];
    final place = Place.mapFromJson(itemById);
    return place;
  }
}

final placesJson = [
  {
    "name": "Los Cabos",
    "country": "México",
    "description":
        "Cabo San Lucas es un balneario en el extremo sur de la península de Baja California en México, conocido por sus playas, actividades acuáticas y vida nocturna. La Playa El Médano es la principal del Cabo, con restaurantes al aire libre y numerosos bares. Después de la marina, se encuentra el promontorio del Fin de la Tierra, donde está la Playa del Amor y El Arco, una arcada natural en los riscos marinos.",
    "images": [
      "https://assets.simpleviewinc.com/simpleview/image/upload/c_limit,h_1200,q_75,w_1200/v1/clients/loscabosmx/Arco_I9A0109_V2_0bb6b65a-6293-4918-a9dd-6e82822e1299.jpg",
      "https://placetravelmexico.mx/wp-content/uploads/2019/06/1-15-870x555.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRgnMmR72XBEJcfj7dJ6zV5CPQSwiTuXqQcmA&usqp=CAU",
      "https://q-cf.bstatic.com/images/hotel/max1024x768/249/249745350.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTGMmXn5Am5u88VcjADaPg3JEFFbh2TpQmwAg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQUubrB_bMp-HMucmL7wd0keIHKBZWG6PiVng&usqp=CAU",
      "https://hellocabo.com/es/wp-content/uploads/2018/07/los-cabos-arch.jpg"
    ],
    "rate": 4.7,
    "visits": 210000,
    "id": 1
  },
  {
    "name": "Cancún",
    "country": "México",
    "description":
        "Cancún es una ciudad de México ubicada en la península de Yucatán que limita con el mar Caribe y que es conocida por sus playas, los numerosos centros turísticos y la vida nocturna. Se compone de 2 áreas distintas: el área del centro más tradicional y la Zona Hotelera, la franja costera con hoteles altos, clubes nocturnos, tiendas y restaurantes. Cancún también es un destino popular entre estudiantes durante el período de vacaciones universitarias en la primavera.",
    "images": [
      "https://www.eleconomista.com.mx/__export/1552017533918/sites/eleconomista/img/2019/01/31/cancun_shutterstock_1112880206.jpg_1348255499.jpg",
      "https://www.aviatur.com/source/contenidos/conece-las-playas-de-cancun-famosas-en-el-mundo.jpg",
      "https://www.expreso.info/files/2020-06/Cancun_0.jpg",
      "https://images.bestday.com/_Lib/Images/Cancun/Cancun/main_cancun.jpg"
    ],
    "rate": 5,
    "visits": 32000,
    "id": 2
  },
  {
    "name": "Playa Tamarindo",
    "country": "Puerto Rico",
    "description":
        "La Playa Tamarindo se encuentra al final de la carretera #333 en el Bosque Seco de Guánica. Esta preciosa playa tiene una costa extensa, el agua es cristalina y la arena es blanca. Es uno de los mejores puntos para apreciar el ecosistema del bosque. Le recomendamos que sea precavido al nadar, pues la playa da al mar abierto. La playa cuenta con área de pesca recreativa. En época de lluvia parte del estacionamiento se inunda, pero se puede llegar a la playa a través de una vereda que bordea el mar.",
    "images": [
      "https://photos.zeepuertorico.com/GU%c3%81NICA-Playa%20Tamarindo%20Gu%c3%a1nica%5EIMG_6072-BIG.jpg",
      "https://islandsofpuertorico.com/images/puerto-rico-culebra-beaches-best-snorkeling-sea-turtles-85.jpg",
      "https://media-cdn.tripadvisor.com/media/photo-m/1280/14/62/69/c4/august-2018.jpg"
    ],
    "rate": 4,
    "visits": 12000,
    "id": 3
  },
  {
    "name": "Paton",
    "country": "Tailandia",
    "description":
        "Patong es un balneario de la costa oeste de la isla de Phuket, frente al mar de Andamán, en el suroeste de Tailandia. La playa de arena con forma de medialuna está bordeada de cafés, restaurantes y bares. El ambiente conocido y estridente de vida nocturna incluye bares de cerveza, bares y clubes nocturnos, salones de masaje y cabarés que se desbordan a la calle Bangla Road, iluminada con neones, y en el complejo Patong OTOP Shopping Paradise.",
    "images": [
      "https://a.cdn-hotels.com/gdcs/production9/d373/472cd0fd-e139-42de-85a3-536c7559b321.jpg",
    ],
    "rate": 4,
    "visits": 12000,
    "id": 4
  }
];
