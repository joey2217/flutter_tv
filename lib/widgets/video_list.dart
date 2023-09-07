import 'package:flutter/material.dart';
import 'package:flutter_tv/store/video.dart';
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
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemCount: playList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == playIndex) {
            return ElevatedButton(
              onPressed: () {},
              child: Text('${playList[index].label}$index'),
            );
          } else {
            return OutlinedButton(
              onPressed: () {
                context.read<VideoModal>().play(index);
              },
              child: Text(playList[index].label),
            );
          }
        });
  }
}
