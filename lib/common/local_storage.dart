import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_tv/models/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _prefs;

  static Profile profile = Profile(null);

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    String? profileStr = _prefs.getString('profile');
    debugPrint('profileStr:$profileStr');
    if (profileStr != null) {
      profile = Profile.fromJson(jsonDecode(profileStr));
    }
  }

  static saveProfile() {
    debugPrint('saveProfile:${profile.toJson()}');
    _prefs.setString("profile", jsonEncode(profile.toJson()));
  }
}
