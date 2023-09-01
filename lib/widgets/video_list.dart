import 'package:flutter/material.dart';
import 'package:flutter_tv/common/utils.dart';

class VideoList extends StatelessWidget {
  final List<LiveItem> liveItems;

  const VideoList({super.key, required this.liveItems});

  @override
  Widget build(BuildContext context) {
    return  const Text("VideoList");
  }
}
