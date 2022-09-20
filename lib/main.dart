import 'package:flutter/material.dart';
import 'package:flutter_tv/common/global.dart';
import 'package:flutter_tv/pages/home.dart';
import 'package:flutter_tv/states/count_model.dart';
import 'package:flutter_tv/states/theme_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Global.init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const MaterialApp(
              home: Center(
                child: Text('Loading...'),
              ),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => CountModel(),
              ),
              ChangeNotifierProvider(
                create: (context) => ThemeModel(),
              ),
            ],
            child: Consumer<ThemeModel>(
              builder:
                  (BuildContext context, ThemeModel themeModel, Widget? child) {
                return MaterialApp(
                  title: 'Flutter TV',
                  theme: ThemeData(
                    primarySwatch: themeModel.theme,
                  ),
                  routes: {},
                  home: const HomePage(),
                );
              },
            ),
          );
        });
  }
}
