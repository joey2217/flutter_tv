import 'package:flutter/material.dart';
import 'package:flutter_tv/store/video.dart';
import 'package:flutter_tv/widgets/video_app.dart';
import 'package:provider/provider.dart';

class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    var playList = context.read<VideoModal>().playList;
    var playIndex = context.watch<VideoModal>().playIndex;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemCount: playList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == playIndex) {
            return ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
              label: Text(
                playList[index].label,
                maxLines: 1,
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
            );
          } else {
            return OutlinedButton(
              onPressed: () {
                var url = context.read<VideoModal>().play(index);
                videoAppKey.currentState?.updateVideoUrl(url);
              },
              child: Text(
                playList[index].label,
                maxLines: 1,
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
            );
          }
        });
  }
}
