import 'package:flutter/material.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:get/get.dart';

class SearchItem extends StatelessWidget {
  final Video video;

  const SearchItem({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        debugPrint('Card tapped. ${video.vodId}');
        Get.toNamed("/video/${video.vodId}");
      },
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Image.network(
              video.vodPic,
              width: 100,
              fit: BoxFit.fitHeight,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(video.vodName),
                Text(
                  video.vodActor,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  video.vodContent,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
