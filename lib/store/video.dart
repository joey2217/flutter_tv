import 'package:flutter/foundation.dart';
import 'package:flutter_tv/common/dio_request.dart';
import 'package:flutter_tv/common/utils.dart';
import 'package:flutter_tv/models/video.dart';

class VideoModal extends ChangeNotifier {
  late Video video;
  List<LiveItem> playList = [];
  String playUrl = '';
  var playIndex = 0;

  Future<bool> fetchVideo(int id) async {
    var data = await DioRequest().fetchMovie(id);
    video = data;
    playList = parsePlayUrl(video.vodPlayFrom, video.vodPlayUrl);
    if (playList.isNotEmpty) {
      playUrl = playList[playIndex].url;
    }
    notifyListeners();
    return true;
  }

  play(int index) {
    playIndex = index;
    playUrl = playList[index].url;
    notifyListeners();
  }
}
