import 'package:flutter/material.dart';
import 'package:flutter_tv/routes/home.dart';
import 'package:flutter_tv/routes/library.dart';
import 'package:flutter_tv/routes/mine.dart';
import 'package:flutter_tv/store/app.dart';
import 'package:flutter_tv/widgets/app_search_bar.dart';
import 'package:provider/provider.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Library(),
    Mine(),
  ];

  @override
  Widget build(BuildContext context) {
    var navIndex = context.watch<AppModel>().navIndex;
    return Scaffold(
      appBar: AppBar(
        title: const AppSearchBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(child: _widgetOptions.elementAt(navIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.perm_identity_outlined),
            label: '设置',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: navIndex,
        selectedItemColor: Colors.amber[800],
        onTap: context.read<AppModel>().setNavIndex,
      ),
    );
  }
}
