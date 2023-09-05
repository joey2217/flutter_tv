import 'package:flutter/material.dart';
import 'package:flutter_tv/common/local_storage.dart';
import 'package:flutter_tv/models/profile.dart';
import 'package:get/get.dart';

class StateController extends GetxController {
  var profile = LocalStorage.profile;
  int navIndex = 0;

  static StateController get to => Get.find();

  changeTheme(AppTheme theme) {
    profile.theme = theme;
    if (theme == AppTheme.system) {
      Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    } else if (theme == AppTheme.light) {
      Get.changeTheme(ThemeData.light());
    } else {
      Get.changeTheme(ThemeData.dark());
    }
    LocalStorage.saveProfile();
    update();
  }

  onNavTap(int index) {
    navIndex = index;
    update();
  }
}
