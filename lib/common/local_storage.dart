import 'dart:convert';
import 'package:flutter_tv/models/profile.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxService {
  static late SharedPreferences _prefs;

  static Profile profile = Profile(AppTheme.system);

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    String? profileStr = _prefs.getString('profile');
    if (profileStr != null) {
      profile = Profile.fromJson(jsonDecode(profileStr));
    }
  }

  static saveProfile() =>
      _prefs.setString("profile", jsonEncode(profile.toJson()));
}
