import 'package:flutter/material.dart';
import 'package:my_app/views/router/NameRouter.dart';

var routes = {'/NameRouter': (context) => NameRouter()};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function page = routes[name] as Function;

  Route route;
  if (settings.arguments != null) {
    route = MaterialPageRoute(
        builder: (context) => page(context, arguments: settings.arguments));
  } else {
    route = MaterialPageRoute(builder: (context) => page(context));
  }
  return route;
};
