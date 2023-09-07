import 'dart:convert';
import 'package:flutter_tv/models/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _prefs;

  static Profile profile = Profile(null);

  static Future<void> init() async {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    _prefs = await SharedPreferences.getInstance();
    String? profileStr = _prefs.getString('profile');
    if (profileStr != null) {
      profile = Profile.fromJson(jsonDecode(profileStr));
    }
  }

  static saveProfile() =>
      _prefs.setString("profile", jsonEncode(profile.toJson()));
}
