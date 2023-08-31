import 'package:flutter/material.dart';
import 'package:flutter_tv/common/dio_request.dart';
import 'package:flutter_tv/widgets/video_app.dart';
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
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  // 请求失败，显示错误
                  return Text("Error: ${snapshot.error}");
                } else {
                  // 请求成功，显示数据
                  return const Column(
                    children: [VideoApp()],
                  );
                }
              } else {
                // 请求未结束，显示loading
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
