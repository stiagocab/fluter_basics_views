import 'package:flutter/material.dart';
// routes
import 'package:flutter_basics/src/pages/basic_page.dart';
import 'package:flutter_basics/src/pages/home_page.dart';
import 'package:flutter_basics/src/pages/scroll_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    "home": (BuildContext context) => HomePage(),
    "basic": (BuildContext context) => BasicPage(pageTitle: "Basic Page"),
    "scroll": (BuildContext context) => ScrollPage(pageTitle: "Basic Page"),
  };
}
