import 'package:dio/dio.dart';
import 'package:flutter_tv/common/request_cache.dart';
import 'package:flutter_tv/models/video_response.dart';

const baseURL = 'https://jyzyapi.com/provide/vod/at/json';

final dio = Dio(BaseOptions(baseUrl: baseURL));

const hotMovieIds = [
  40626, //流浪地球
  40650, // 满江红
  43017, //灌篮高手
  42928, //忠犬八公
  42076, // 保你平安
  31756, // 四海
];

class DioRequest {
  static init() {
    dio.interceptors.add(
      RequestCache(),
    );
  }

  Future<VideoResponse> fetchHotMovies() async {
    final res = await dio.get('',
        queryParameters: {'ac': 'detail', 'ids': hotMovieIds.join(',')});
    var videoResponse = VideoResponse.fromJson(res.data);
    print('fetchHotMovies code= ${videoResponse.code}');
    videoResponse.list.sort(((a, b) =>
        hotMovieIds.indexOf(a.vodId).compareTo(hotMovieIds.indexOf(b.vodId))));
    return videoResponse;
  }
}
