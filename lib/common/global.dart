import 'package:flutter_tv/common/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static late SharedPreferences _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    // TODO 本地数据
    Http.init();
  }
}
