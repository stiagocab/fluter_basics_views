import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BasicPage extends StatelessWidget {
  String pageTitle;
  final List images = [
    "https://www.alcaldesdemexico.com/wp-content/uploads/2014/07/Baja-California-Minuta-Loca-Agosto-2013-1024x750.jpg",
    "https://www.reflectresorts.com/content/dam/amr/photography/reflect/rkglc/RKGLC-EXT-Aerial-1A-RGB.jpg",
    "https://www.alcaldesdemexico.com/wp-content/uploads/2014/07/Baja-California-Minuta-Loca-Agosto-2013-1024x750.jpg",
    "https://www.reflectresorts.com/content/dam/amr/photography/reflect/rkglc/RKGLC-EXT-Aerial-1A-RGB.jpg",
    "https://assets.simpleviewinc.com/simpleview/image/upload/c_limit,h_1200,q_75,w_1200/v1/clients/loscabosmx/Arco_I9A0109_V2_0bb6b65a-6293-4918-a9dd-6e82822e1299.jpg",
    "https://www.reflectresorts.com/content/dam/amr/photography/reflect/rkglc/RKGLC-EXT-Aerial-1A-RGB.jpg",
  ];

  BasicPage({Key key, this.pageTitle = "HI"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: <Widget>[
          _buildHead(),
          _renderInfo(context),
        ],
      ),
    );
  }

  Widget _renderInfo(context) {
    // Dummy text Description
    final String description =
        "Cabo San Lucas es un balneario en el extremo sur de la península de Baja California en México, conocido por sus playas, actividades acuáticas y vida nocturna. La Playa El Médano es la principal del Cabo, con restaurantes al aire libre y numerosos bares. Después de la marina, se encuentra el promontorio del Fin de la Tierra, donde está la Playa del Amor y El Arco, una arcada natural en los riscos marinos.";

    final double rate = 5.0;

    return ListView(
      children: <Widget>[
        Container(
          color: Colors.grey[900],
          padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0, bottom: 50.0),
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
                          "LOS CABOS",
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
                  Text(rate.toString())
                ],
              ),
              SizedBox(height: 20.0),
              _renderOptions(),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              _renderImages(context)
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

  Widget _buildHead() {
    return Stack(
      children: <Widget>[
        FadeInImage(
          height: 280.0,
          width: double.infinity,
          placeholder: AssetImage("assets/img/grey.png"),
          image: NetworkImage(
            "https://images.unsplash.com/photo-1588801092859-418d909759ad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80",
          ),
        ),
      ],
    );
  }

  Widget _renderImages(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final List<Widget> imagesList = List();

    images.forEach((element) {
      imagesList.add(
        FadeInImage(
          width: media.width * 0.3,
          placeholder: AssetImage("assets/img/grey.png"),
          image: NetworkImage(element),
          fit: BoxFit.cover,
        ),
      );
    });
    images.forEach((element) {
      imagesList.add(
        FadeInImage(
          width: media.width * 0.3,
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
