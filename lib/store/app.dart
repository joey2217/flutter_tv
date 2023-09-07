import 'package:flutter/foundation.dart';
import 'package:flutter_tv/common/local_storage.dart';
import 'package:flutter_tv/models/profile.dart';

class AppModel extends ChangeNotifier {
  int navIndex = 0;
  Profile profile = LocalStorage.profile;

  AppModel();

  setNavIndex(int index) {
    navIndex = index;
    notifyListeners();
  }

  changeTheme(Brightness theme) {
    profile.brightness = theme;
    LocalStorage.saveProfile();
    notifyListeners();
  }

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(IntProperty('navIndex', navIndex));
  // }
}
