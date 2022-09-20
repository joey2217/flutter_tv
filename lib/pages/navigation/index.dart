import 'package:flutter/material.dart';
import 'package:flutter_tv/api/videoApi.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:flutter_tv/states/count_model.dart';
import 'package:flutter_tv/states/theme_model.dart';
import 'package:flutter_tv/widgets/video_item.dart';
import 'package:provider/provider.dart';

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
    return ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return VideoItem(video: _list[index]);
        });
  }

  _getData() async {
    var data = await VideoApi().getVideoList({'page': _page});
    var videoList = data.list;
    if (_page == 1) {
      _list = videoList;
    } else {
      _list.addAll(videoList);
    }
  }
}
