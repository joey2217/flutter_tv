import 'package:flutter/material.dart';
import 'package:flutter_tv/store/home.dart';
import 'package:flutter_tv/widgets/video_grid.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
              child: Text(
                "电影",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          VideoGrid(list: context.watch<HomeModel>().movies),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
              child: Text(
                "电视剧",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          VideoGrid(list: context.watch<HomeModel>().tvs),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
              child: Text(
                "动漫",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          VideoGrid(list: context.watch<HomeModel>().cartoon),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
              child: Text(
                "综艺",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          VideoGrid(list: context.watch<HomeModel>().varieties),
        ],
      ),
    );
  }
}
