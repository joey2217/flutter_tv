import 'package:flutter/material.dart';
import 'package:flutter_tv/store/video.dart';
import 'package:flutter_tv/widgets/video_app.dart';
import 'package:flutter_tv/widgets/video_tab.dart';
import 'package:provider/provider.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: context.read<VideoModal>().fetchVideo(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var video = context.read<VideoModal>().video;
              var playUrl = context.watch<VideoModal>().playUrl;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                          top: 10,
                          left: 10,
                          child: IconButton(
                            icon: const Icon(Icons.chevron_left),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                      playUrl == ''
                          ? const Center(
                              child: AspectRatio(
                                aspectRatio: 16.0 / 9.0,
                                child: Text('Loading'),
                              ),
                            )
                          : VideoApp(
                              liveUrl: playUrl,
                            )
                    ],
                  ),
                  Text(video.vodName),
                  const Expanded(
                    child: VideoTab(),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
