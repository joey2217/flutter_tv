import 'package:flutter/material.dart';
import 'package:flutter_tv/common/local_storage.dart';
import 'package:get/get.dart';

class StateController extends GetxController {
  var profile = LocalStorage.profile;
  int navIndex = 0;

  static StateController get to => Get.find();

  Brightness? get brightness => profile.brightness;

  changeTheme(Brightness brightness) {
    profile.brightness = brightness;
    LocalStorage.saveProfile();
    update();
  }

  onNavTap(int index) {
    navIndex = index;
    update();
  }
}
