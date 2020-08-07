import 'package:flutter/material.dart';
// routes
import 'package:flutter_basics/src/pages/basic_page.dart';
import 'package:flutter_basics/src/pages/home_page.dart';
import 'package:flutter_basics/src/pages/menu_page/menu_page.dart';
import 'package:flutter_basics/src/pages/scroll_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    "home": (BuildContext context) => HomePage(),
    "basic": (BuildContext context) => BasicPage(),
    "scroll": (BuildContext context) => ScrollPage(pageTitle: "Basic Page"),
    "menu": (BuildContext context) => MenuPage(),
  };
}
