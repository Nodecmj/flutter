import 'package:flutter/material.dart';

import 'about.dart';
import 'detail.dart';
import 'main.dart';
import 'unknown.dart';

class MJRoute {
  static String initialRoute = HomePage.routeName;
  static Map<String, WidgetBuilder> routes = {
    HomePage.routeName: (ctx) => HomePage(),
    About.routeName: (ctx) => About(),
  };

  static RouteFactory onGenerateRoute = (settings) {
    if (settings.name == DetailPage.routeName) {
      return MaterialPageRoute(builder: (ctx) {
        return DetailPage(settings.arguments);
      });
    }
    return null;
  };
  static RouteFactory onUnknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) => Unknown());
  };
}
