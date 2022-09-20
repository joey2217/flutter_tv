import 'package:flutter/material.dart';
import 'package:flutter_tv/common/constants.dart';

class ThemeModel extends ChangeNotifier {
  MaterialColor _theme = themeColors[0];

  MaterialColor get theme => _theme;

  set theme(MaterialColor color) {
    if (color != _theme) {
      _theme = color;
      notifyListeners();
    }
  }
}
