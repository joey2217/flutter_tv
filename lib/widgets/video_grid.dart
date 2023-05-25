import 'package:flutter/widgets.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:flutter_tv/widgets/video_card.dart';

class VideoGrid extends StatelessWidget {
  const VideoGrid({super.key, required this.list, required this.title});

  final List<Video> list;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$title + ${list.length}"),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //横轴三个子widget
              childAspectRatio: 1.0 //宽高比为1时，子widget
              ),
          itemBuilder: (context, index) => VideoCard(video: list[index]),
        ),
      ],
    );
  }
}
