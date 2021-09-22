import 'package:flutter/material.dart';
import 'package:my_app/views/router/NameRouter.dart';
import 'package:my_app/views/videoPlay/videoPlay.dart';
import 'package:my_app/views/imagePick/ImagePick.dart';

var routes = {
  '/NameRouter': (context) => NameRouter(),
  '/videoPlay': (context) => VideoApp(),
  '/imagePick': (context) => ImagePick(),
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function page = routes[name] as Function;

  Route route;
  if (settings.arguments != null) {
    route = MaterialPageRoute(
      builder: (context) => page(context, arguments: settings.arguments),
    );
  } else {
    route = MaterialPageRoute(builder: (context) => page(context));
  }
  return route;
};
