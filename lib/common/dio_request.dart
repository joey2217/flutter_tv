import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_tv/common/request_cache.dart';
import 'package:flutter_tv/models/search_param.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:flutter_tv/models/video_response.dart';

const baseURL = 'https://jyzyapi.com/provide/vod/at/json';

final dio = Dio(BaseOptions(baseUrl: baseURL));

class DioRequest {
  static init() {
    dio.interceptors.add(
      RequestCache(),
    );
  }

  Future<VideoResponse> fetchHots(List<int> idList) async {
    var ids = idList.join(',');
    var param = {'ac': 'detail', 'ids': ids};
    final res = await dio.get('', queryParameters: param);
    var videoResponse = VideoResponse.fromJson(jsonDecode(res.data));
    videoResponse.list.sort(
        ((a, b) => idList.indexOf(a.vodId).compareTo(idList.indexOf(b.vodId))));
    return videoResponse;
  }

  Future<Video> fetchMovie(int id) async {
    var param = {'ac': 'detail', 'ids': id};
    final res = await dio.get('', queryParameters: param);
    var videoResponse = VideoResponse.fromJson(jsonDecode(res.data));
    if (videoResponse.list.isNotEmpty) {
      return videoResponse.list[0];
    }
    throw "请求错误";
  }

  Future<VideoResponse> fetchSearchVideos(SearchParam params) async {
    Map<String, dynamic> queryParameters = {'ac': 'detail'};
    if (params.keyword != null && params.keyword!.isNotEmpty) {
      queryParameters['wd'] = params.keyword!;
    }
    if (params.type != null) {
      queryParameters['t'] = params.type!;
    }
    queryParameters['pg'] = params.page;
    final res = await dio.get('', queryParameters: queryParameters);
    var videoResponse = VideoResponse.fromJson(jsonDecode(res.data));
    return videoResponse;
  }
}
