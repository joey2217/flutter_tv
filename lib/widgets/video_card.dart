import 'package:flutter/material.dart';
import 'package:flutter_tv/models/video.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped. ${video.vodId}');
          Navigator.pushNamed(context, '/video', arguments: video.vodId);
        },
        child: GridTile(
          footer: Material(
            color: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
            ),
            clipBehavior: Clip.antiAlias,
            child: GridTileBar(
              backgroundColor: Colors.black45,
              title: Text(video.vodName),
              subtitle: Text(
                '${video.vodRemarks}(${video.vodTime})',
                maxLines: 1,
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
            ),
          ),
          child: Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              video.vodPic,
              width: 285,
              height: 400,
              fit: BoxFit.fitWidth,
            ),
          ),
        ));
  }
}
