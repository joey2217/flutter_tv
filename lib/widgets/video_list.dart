import 'package:flutter/material.dart';
import 'package:flutter_tv/states/video.dart';

// TODO 滚动 多页

class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = VideoController.to;
    var list = controller.playList;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2,
        ),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == controller.playIndex) {
            return ElevatedButton(
              onPressed: () {},
              child: Text('${list[index].label}$index'),
            );
          } else {
            return OutlinedButton(
              onPressed: () {
                controller.play(index);
              },
              child: Text(list[index].label),
            );
          }
        });
  }
}
