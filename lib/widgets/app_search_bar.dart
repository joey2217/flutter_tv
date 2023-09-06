import 'package:flutter/material.dart';
import 'package:flutter_tv/states/state.dart';
import 'package:flutter_tv/states/video_lib.dart';
import 'package:get/get.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StateController>(builder: (stateController) {
      var isSelected = stateController.brightness == null
          ? stateController.brightness == Brightness.dark
          : Theme.of(context).brightness == Brightness.dark;
      VideoLibController videoLibController = VideoLibController.to;
      return SearchBar(
        onSubmitted: (value) {
          debugPrint('SearchBar value $value');
          if (stateController.navIndex != 1) {
            stateController.onNavTap(1);
          }
          videoLibController.search(value);
        },
        padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0)),
        leading: const Icon(Icons.search),
        trailing: <Widget>[
          Tooltip(
            message: '修改主题',
            child: IconButton(
              isSelected: isSelected,
              onPressed: () {
                if (isSelected) {
                  stateController.changeTheme(Brightness.light);
                } else {
                  stateController.changeTheme(Brightness.dark);
                }
              },
              icon: const Icon(Icons.wb_sunny_outlined),
              selectedIcon: const Icon(Icons.brightness_2_outlined),
            ),
          )
        ],
      );
    });
  }
}
