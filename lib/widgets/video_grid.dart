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
        Text(title),
        GridView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => VideoCard(video: list[index]),
        ),
      ],
    );
  }
}
