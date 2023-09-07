import 'package:flutter/foundation.dart';
import 'package:flutter_tv/common/dio_request.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:flutter_tv/models/video_response.dart';

class HomeModel extends ChangeNotifier {
  var movies = <Video>[];

  HomeModel() {
    fetchData();
  }

  fetchData() {
    List<Future<VideoResponse>> futures = [DioRequest().fetchHotMovies()];
    return Future.wait(futures).then((value) {
      movies.addAll(value[0].list);
      notifyListeners();
    });
  }
}
