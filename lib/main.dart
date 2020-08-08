import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/routes.dart';
import 'package:flutter_basics/src/pages/error_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: true,
      title: 'Design flutter',
      initialRoute: "home",
      routes: getAppRoutes(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => ErrorPage(
            pageTitle: settings.name,
          ),
        );
      },
    );
  }
}
