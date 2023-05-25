import 'package:flutter/material.dart';
import 'package:flutter_tv/routes/home.dart';
import 'package:flutter_tv/routes/library.dart';
import 'package:flutter_tv/routes/setting.dart';
import 'package:flutter_tv/states/home.dart';
import 'package:flutter_tv/states/state.dart';
import 'package:get/get.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Library(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    final StateController c = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("navIndex: ${c.navIndex}")),
      ),
      body: Center(
        child: Obx(() => _widgetOptions.elementAt(c.navIndex.value)),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '首页',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: '片库',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '设置',
                backgroundColor: Colors.pink,
              ),
            ],
            currentIndex: c.navIndex.value,
            selectedItemColor: Colors.amber[800],
            onTap: (value) => c.navIndex.value = value,
          )),
    );
  }
}
