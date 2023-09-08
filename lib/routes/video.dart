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
                      VideoApp(
                        key: videoAppKey,
                        liveUrl: playUrl,
                      ),
                      Positioned(
                          top: 10,
                          left: 10,
                          child: IconButton(
                            icon: const Icon(Icons.chevron_left),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: Text(
                      video.vodName,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: Text(
                      "${video.vodRemarks} · ${video.vodTime}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: Text(
                      "${video.typeName} · ${video.vodArea} · ${video.vodLang}}",
                      maxLines: 1,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
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
