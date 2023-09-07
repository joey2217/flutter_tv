import 'package:flutter/material.dart';
import 'package:flutter_tv/store/app.dart';
import 'package:flutter_tv/store/library.dart';
import 'package:provider/provider.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppModel, LibraryModal>(
      builder: (BuildContext context, AppModel appModel,
          LibraryModal libraryModal, Widget? child) {
        var isSelected = appModel.profile.brightness == null
            ? appModel.profile.brightness == Brightness.dark
            : Theme.of(context).brightness == Brightness.dark;
        return SearchBar(
          onSubmitted: (value) {
            debugPrint('SearchBar value $value');
            if (appModel.navIndex != 1) {
              appModel.setNavIndex(1);
            }
            libraryModal.search(value);
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
                    appModel.changeTheme(Brightness.light);
                  } else {
                    appModel.changeTheme(Brightness.dark);
                  }
                },
                icon: const Icon(Icons.wb_sunny_outlined),
                selectedIcon: const Icon(Icons.brightness_2_outlined),
              ),
            )
          ],
        );
      },
    );
  }
}
