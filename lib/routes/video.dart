import 'package:flutter/material.dart';
import 'package:flutter_tv/common/dio_request.dart';
import 'package:flutter_tv/states/video.dart';
import 'package:flutter_tv/widgets/video_app.dart';
import 'package:flutter_tv/widgets/video_tab.dart';
import 'package:get/get.dart';

class Video extends StatelessWidget {
  const Video({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id'];
    debugPrint('id:$id');
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: DioRequest().fetchMovie(id!),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return GetBuilder<VideoController>(
                    init: VideoController(),
                    builder: (controller) {
                      debugPrint('data:${snapshot.data}');
                      controller.setVideo(snapshot.data!);
                      var playUrl = controller.playUrl;
                      var video = controller.video;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          playUrl == ''
                              ? const Center(
                                  child: AspectRatio(
                                    aspectRatio: 16.0 / 9.0,
                                    child: Text('Loading'),
                                  ),
                                )
                              : VideoApp(
                                  liveUrl: playUrl,
                                ),
                          Text(video.vodName),
                          const Expanded(
                            child: VideoTab(),
                          ),
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
