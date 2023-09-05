import 'package:flutter/material.dart';
import 'package:flutter_tv/common/dio_request.dart';
import 'package:flutter_tv/common/local_storage.dart';
import 'package:flutter_tv/routes/video.dart';
import 'package:flutter_tv/routes/index.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await initServices();

  /// 等待服务初始化.
  runApp(const MyApp());
}

Future<void> initServices() async {
  DioRequest.init();
  await LocalStorage.init();

  ///这里是你放get_storage、hive、shared_pref初始化的地方。
  ///或者moor连接，或者其他什么异步的东西。
  print('All services started...');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "FlutterTV",
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Index()),
        GetPage(name: '/video/:id', page: () => const Video()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
