import 'package:flutter/material.dart';
import 'package:flutter_tv/states/video.dart';

class VideoInfo extends StatelessWidget {
  const VideoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var video = VideoController.to.video;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          video.vodName,
          style: const TextStyle(fontSize: 18),
        ),
        Image.network(video.vodPic),
      ],
    );
  }
}
