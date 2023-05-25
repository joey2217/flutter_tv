import 'package:flutter/material.dart';
import 'package:flutter_tv/models/video.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        //背景装饰
        gradient: RadialGradient(
          //背景径向渐变
          colors: [Colors.blue, Colors.greenAccent],
          center: Alignment.topLeft,
          radius: .98,
        ),
        boxShadow: [
          //卡片阴影
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0,
          )
        ],
      ),
      child: Column(
        children: [
          Text(video.vodName),
          Image.network(video.vodPic),
        ],
      ),
    );
  }
}
