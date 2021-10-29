import 'package:flutter/material.dart';

class ThemeInfo extends ChangeNotifier {
  Color? _themeColor;

  Color? get getColor => _themeColor;

  set setColor(Color v) {
    _themeColor = v;
    notifyListeners();
  }
}
