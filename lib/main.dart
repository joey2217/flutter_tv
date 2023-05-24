import 'package:flutter/material.dart';
import 'package:flutter_tv/common/local_storage.dart';
import 'package:flutter_tv/routes/index.dart';
import 'package:flutter_tv/states/state.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await initServices();

  /// 等待服务初始化.
  runApp(MyApp());
}

Future<void> initServices() async {
  print('starting services ...');
  await LocalStorage.init();

  ///这里是你放get_storage、hive、shared_pref初始化的地方。
  ///或者moor连接，或者其他什么异步的东西。
  print('All services started...');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    Get.put(StateController());

    return GetMaterialApp(
      title: "app",
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Index()),
      ],
    );
  }
}
