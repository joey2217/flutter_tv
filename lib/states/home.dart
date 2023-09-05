import 'package:flutter_tv/common/dio_request.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final movies = <Video>[];

  static HomeController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();
    var data = await DioRequest().fetchHotMovies();
    movies.addAll(data.list);
    update();
  }
}
