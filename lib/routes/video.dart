import 'package:flutter/material.dart';
import 'package:flutter_tv/common/dio_request.dart';
import 'package:flutter_tv/common/utils.dart';
import 'package:flutter_tv/widgets/video_app.dart';
import 'package:flutter_tv/widgets/video_list.dart';
import 'package:flutter_tv/widgets/video_tab.dart';
import 'package:get/get.dart';

class Video extends StatelessWidget {
  const Video({super.key});

  @override
  Widget build(BuildContext context) {
    var id = Get.parameters['id'];
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: DioRequest().fetchMovie(id!),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                var liveItems = parsePlayUrl(
                    snapshot.data!.vodPlayFrom, snapshot.data!.vodPlayUrl);
                return Column(
                  children: [
                    const SizedBox(
                      height: 200,
                      child: Text("header"),
                    ),
                    VideoApp(
                      liveUrl: liveItems[0].url,
                    ),
                    VideoList(
                      liveItems: liveItems,
                    ),
                    Container(
                      child: Text(snapshot.data!.vodName),
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
            }),
      ),
    );
  }
}
