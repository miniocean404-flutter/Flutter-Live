import 'package:flutter/material.dart';
import 'package:my_app/utils/sp-helper.dart';

import 'key.dart';

class ThemeInfo extends ChangeNotifier {
  String? _themeColor;

  String? get getColor => _themeColor;

  set setColor(String v) {
    _themeColor = v;

    SpHelper.setLocalStorage(keyThemeColor, v);
    notifyListeners();
  }
}
