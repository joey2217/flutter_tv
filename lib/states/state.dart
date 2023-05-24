import 'package:flutter/material.dart';
import 'package:flutter_tv/common/local_storage.dart';
import 'package:flutter_tv/models/profile.dart';
import 'package:get/get.dart';

class StateController extends GetxController {
  var profile = LocalStorage.profile.obs;
  var navIndex = 0.obs;

  changeTheme(AppTheme theme) {
    profile.value.theme = theme;
    if (theme == AppTheme.system) {
      Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    } else if (theme == AppTheme.light) {
      Get.changeTheme(ThemeData.light());
    } else {
      Get.changeTheme(ThemeData.dark());
    }
    LocalStorage.saveProfile();
  }

  onNavTap(int index) {
    navIndex.value = index;
  }
}
