import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_tv/common/request_cache.dart';
import 'package:flutter_tv/models/video.dart';
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
    var ids = hotMovieIds.join(',');
    var param = {'ac': 'detail', 'ids': ids};
    final res = await dio.get('', queryParameters: param);
    var videoResponse = VideoResponse.fromJson(jsonDecode(res.data));
    videoResponse.list.sort(((a, b) =>
        hotMovieIds.indexOf(a.vodId).compareTo(hotMovieIds.indexOf(b.vodId))));
    return videoResponse;
  }

  Future<Video> fetchMovie(String id) async {
    var param = {'ac': 'detail', 'ids': id};
    final res = await dio.get('', queryParameters: param);
    var videoResponse = VideoResponse.fromJson(jsonDecode(res.data));
    if (videoResponse.list.isNotEmpty) {
      return videoResponse.list[0];
    }
    throw "请求错误";
  }
}
