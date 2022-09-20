import 'package:flutter/material.dart';
import 'package:flutter_tv/models/video.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                video.vodPic,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            video.vodName,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
