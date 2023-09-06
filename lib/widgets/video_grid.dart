import 'package:flutter/widgets.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:flutter_tv/widgets/video_card.dart';

class VideoGrid extends StatelessWidget {
  const VideoGrid({super.key, required this.list});

  final List<Video> list;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (context, index) => VideoCard(video: list[index]),
    );
  }
}
