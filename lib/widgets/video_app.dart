import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

const url = 'https://hd.ijycnd.com/play/7axmKRnb/index.m3u8';

GlobalKey<_VideoAppState> videoAppKey = GlobalKey<_VideoAppState>();

class VideoApp extends StatefulWidget {
  final String liveUrl;

  const VideoApp({super.key, required this.liveUrl});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;
  var loading = true;

  @override
  void initState() {
    super.initState();
    updateVideoUrl(widget.liveUrl);
  }

  updateVideoUrl(String url) {
    setState(() {
      loading = true;
    });
    _controller = VideoPlayerController.networkUrl(Uri.parse(url));
    _controller.initialize().then((_) {
      _chewieController = ChewieController(
          videoPlayerController: _controller,
          autoPlay: true,
          optionsTranslation: OptionsTranslation(cancelButtonText: "返回"));
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: !loading &&
              _chewieController != null &&
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
