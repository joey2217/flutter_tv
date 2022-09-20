import 'package:flutter/material.dart';
import 'package:flutter_tv/api/videoApi.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:flutter_tv/widgets/video_item.dart';

class IndexNavigation extends StatefulWidget {
  const IndexNavigation({super.key});

  @override
  State<IndexNavigation> createState() => _IndexNavigationState();
}

class _IndexNavigationState extends State<IndexNavigation> {
  final int _page = 1;
  List<Video> _list = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 每行三列
          childAspectRatio: 0.75, //显示区域宽高相等
          mainAxisSpacing: 4,
        ),
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return VideoItem(video: _list[index]);
        },
      ),
    );
  }

  _getData() async {
    var data = await VideoApi().getVideoList({'page': _page});
    var videoList = data.list;
    if (_page == 1) {
      setState(() {
        _list = videoList;
      });
    } else {
      setState(() {
        _list.addAll(videoList);
      });
    }
  }
}
