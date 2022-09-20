import 'package:flutter_tv/common/http.dart';
import 'package:flutter_tv/models/response.dart';

class VideoApi {
  Future<Response> getVideoList(Map<String, dynamic> query) async {
    var res = await dio.get('/', queryParameters: {
      'ac': 'detail',
      't': query['type'],
      'pg': query['page'] ?? 1,
      'wd': query['keyword'],
      'limit': query['size'] ?? 20,
    });
    return Response.fromJson(res.data);
  }
}
