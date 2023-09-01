import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

const url = 'https://hd.ijycnd.com/play/7axmKRnb/index.m3u8';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  final String liveUrl;

  const VideoApp({super.key, required this.liveUrl});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.liveUrl));
    _controller.initialize().then((_) {
      _chewieController = ChewieController(
          videoPlayerController: _controller,
          autoPlay: true,
          additionalOptions: (context) {
            return <OptionItem>[
              OptionItem(
                onTap: () => debugPrint('My option works!'),
                iconData: Icons.chat,
                title: 'My localized title',
              ),
              OptionItem(
                onTap: () => debugPrint('Another option that works!'),
                iconData: Icons.chat,
                title: 'Another localized title',
              ),
            ];
          },
          optionsTranslation: OptionsTranslation(cancelButtonText: "返回"));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: _chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized
          ? Chewie(
              controller: _chewieController!,
            )
          : const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Loading'),
              ],
            ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController?.dispose();
  }
}
