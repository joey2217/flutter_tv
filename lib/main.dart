import 'package:flutter/material.dart';
import 'package:flutter_tv/common/local_storage.dart';
import 'package:flutter_tv/routes/index.dart';
import 'package:flutter_tv/routes/video.dart';
import 'package:flutter_tv/store/app.dart';
import 'package:flutter_tv/store/home.dart';
import 'package:flutter_tv/store/library.dart';
import 'package:flutter_tv/store/video.dart';
import 'package:provider/provider.dart';

import 'common/dio_request.dart';

void main() async {
  DioRequest.init();
  await LocalStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('theme: ${MediaQuery.platformBrightnessOf(context)}');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppModel()),
        ChangeNotifierProvider(create: (_) => HomeModel()),
        ChangeNotifierProvider(create: (_) => VideoModal()),
        ChangeNotifierProvider(create: (_) => LibraryModal()),
      ],
      child: Consumer<AppModel>(builder: (context, AppModel appModel, child) {
        return MaterialApp(
          title: 'FlutterTV',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: appModel.profile.brightness ??
                    MediaQuery.platformBrightnessOf(context)),
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const Index(),
            '/video': (context) => const VideoPage(),
          },
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
