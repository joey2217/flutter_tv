import 'package:flutter/material.dart';
import 'package:flutter_tv/common/constants.dart';
import 'package:flutter_tv/pages/navigation/index.dart';
import 'package:flutter_tv/states/theme_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    IndexNavigation(),
    IndexNavigation(),
    IndexNavigation(),
    IndexNavigation(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: '首页',
            backgroundColor: themeColors[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.business),
            label: 'Business',
            backgroundColor: themeColors[1],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.school),
            label: 'School',
            backgroundColor: themeColors[2],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: themeColors[3],
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          context.read<ThemeModel>().theme = themeColors[index];
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
