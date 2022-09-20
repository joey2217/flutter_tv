import 'package:flutter/material.dart';
import 'package:flutter_tv/models/video.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Text(video.vodName);
  }
}
