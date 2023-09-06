import 'package:flutter_tv/common/dio_request.dart';
import 'package:flutter_tv/common/utils.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  var playIndex = 0;
  var video = Video(0, '', 0, '', '', '', 0, '', 0, '', '', '', '', '', 0, '',
      '', '', 0, '', '', 0, '', '', '');

  List<LiveItem> playList = [];

  String playUrl = '';

  Future<bool> fetchVideo(String id) async {
    var data = await DioRequest().fetchMovie(id);
    video = data;
    update();
    return true;
  }

  setVideo(Video v) {
    video = v;
    playList = parsePlayUrl(video.vodPlayFrom, video.vodPlayUrl);
    if (playList.isNotEmpty) {
      playUrl = playList[playIndex].url;
    }
    update();
  }

  play(int index) {
    playIndex = index;
    update();
  }
}
