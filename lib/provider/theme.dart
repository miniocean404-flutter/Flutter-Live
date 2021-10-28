import 'package:flutter/material.dart';

class ThemeInfo extends ChangeNotifier {
  String? _themeColor = '白色';

  String? get getColor => _themeColor;

  set setColor(String v) {
    _themeColor = v;
    notifyListeners();
  }
}
