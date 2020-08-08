import 'package:flutter/material.dart';
import 'package:flutter_basics/src/models/place_model.dart';
import 'package:flutter_basics/src/providers/places_provider.dart';

class BasicPage extends StatefulWidget {
  BasicPage({Key key}) : super(key: key);

  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  Place placeData;
  final placesProvider = PlacesProvider();

  Future loadData(placeId) async {
    final data = placesProvider
        .getPlaceById(placeId); // load your data from SharedPreferences
    return data;
  }

  _chargeData(arguments) {
    loadData(arguments["placeId"]).then((data) {
      setState(() {
        placeData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = ModalRoute.of(context).settings.arguments;
    _chargeData(arguments);
    if (placeData == null) {
      return CircularProgressIndicator();
    }
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        // children: <Widget>[Text("ELEMENTO")],
        children: <Widget>[
          _buildHead(),
          _renderInfo(context, arguments["placeId"]),
        ],
      ),
    );
  }

  Widget _buildHead() {
    return Stack(
      children: <Widget>[
        FadeInImage(
          height: 280.0,
          width: double.infinity,
          placeholder: AssetImage("assets/img/grey.png"),
          image: NetworkImage(placeData.images[0]),
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _renderInfo(context, int placeId) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.grey[900],
          padding:
              EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0, bottom: 50.0),
          margin: EdgeInsets.only(top: 250.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          placeData.name,
                          style: TextStyle(
                              fontSize: 21.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "México",
                          style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Icon(Icons.star),
                  Text(placeData.rate.toString())
                ],
              ),
              SizedBox(height: 20.0),
              _renderOptions(),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  placeData.description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              _renderImages(context),
              PlacesSlide(placeId),
            ],
          ),
        ),
      ],
    );
  }

  Row _renderOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.call, size: 35.0, color: Colors.blueAccent),
              SizedBox(height: 10.0),
              Text(
                "CALL",
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.location_on, size: 35.0, color: Colors.blueAccent),
              SizedBox(height: 10.0),
              Text(
                "ROUTE",
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.share, size: 35.0, color: Colors.blueAccent),
              SizedBox(height: 10.0),
              Text(
                "SHARE",
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _renderImages(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final List<Widget> imagesList = List();

    placeData.images.forEach((element) {
      imagesList.add(
        FadeInImage(
          width: media.width * 0.3,
          height: 100.0,
          placeholder: AssetImage("assets/img/grey.png"),
          image: NetworkImage(element),
          fit: BoxFit.cover,
        ),
      );
    });

    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Wrap(
        children: imagesList,
      ),
    );
  }
}

// ignore: must_be_immutable
class PlacesSlide extends StatelessWidget {
  int idPlace;
  final placesProvider = PlacesProvider();

  PlacesSlide(this.idPlace);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Otros lugares:",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 250.0,
            width: double.infinity,
            child: FutureBuilder(
              future: placesProvider.getFiltered(idPlace),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return PageView.builder(
                    itemCount: snapshot.data.length,
                    controller:
                        PageController(initialPage: 1, viewportFraction: 0.6),
                    itemBuilder: (context, i) {
                      if (snapshot.hasData) {
                        return _cardPlace(snapshot.data[i], context);
                      }
                      return Center();
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardPlace(Place place, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "basic", arguments: {"placeId": place.id});
      },
      child: Stack(
        children: <Widget>[
          Padding(
            // image movie
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage(
                height: 200,
                fit: BoxFit.cover,
                image: NetworkImage(place.images[0]),
                placeholder: AssetImage("assets/img/grey.png"),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 20.0),
            margin: EdgeInsets.only(top: 160.0),
            color: Colors.black45,
            child: Text(place.name),
          )
        ],
      ),
    );
  }
}
