import 'package:flutter/material.dart';
import 'package:flutter_tv/widgets/video_info.dart';
import 'package:flutter_tv/widgets/video_list.dart';

class VideoTab extends StatefulWidget {
  const VideoTab({super.key});

  @override
  State<VideoTab> createState() => _VideoTabState();
}

class _VideoTabState extends State<VideoTab> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar.secondary(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              // icon: Icon(Icons.list),
              text: "播放列表",
            ),
            Tab(
              // icon: Icon(Icons.info),
              text: "简介",
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              controller: _tabController,
              children: const <Widget>[
                VideoList(),
                SingleChildScrollView(child: VideoInfo()),
              ],
            ),
          ),
        )
      ],
    );
  }
}
