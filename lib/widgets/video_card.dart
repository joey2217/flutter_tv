import 'package:flutter/material.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:get/get.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped. ${video.vodId}');
          Get.toNamed("/video/${video.vodId}");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Image.network(
              video.vodPic,
              width: 285,
              height: 400,
              fit: BoxFit.fitWidth,
            )),
            Text(
              video.vodName,
              style: const TextStyle(fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
