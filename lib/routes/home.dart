import 'package:flutter/material.dart';
import 'package:flutter_tv/states/home.dart';
import 'package:flutter_tv/widgets/video_grid.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        final c = Get.find<HomeController>();
        return ListView(
          shrinkWrap: true,
          children: [Text("${c.movies.length}")],
        );
      },
    );
  }
}
