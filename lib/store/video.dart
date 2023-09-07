import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tv/common/dio_request.dart';
import 'package:flutter_tv/common/utils.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:video_player/video_player.dart';

class VideoModal extends ChangeNotifier {
  late Video video;
  List<LiveItem> playList = [];
  String playUrl = '';
  var playIndex = 0;
  late VideoPlayerController controller;
  ChewieController? chewieController;

  Future<bool> fetchVideo(int id) async {
    var data = await DioRequest().fetchMovie(id);
    video = data;
    playList = parsePlayUrl(video.vodPlayFrom, video.vodPlayUrl);
    setVideoController();
    notifyListeners();
    return true;
  }

  setVideoController() async {
    playUrl = playList[playIndex].url;
    controller = VideoPlayerController.networkUrl(Uri.parse(playUrl));
    controller.initialize().then((_) {
      chewieController = ChewieController(
          videoPlayerController: controller,
          autoPlay: true,
          optionsTranslation: OptionsTranslation(cancelButtonText: "返回"));

    });
    notifyListeners();
  }

  @override
  dispose(){}

  play(int index) {
    playIndex = index;
    setVideoController();
    notifyListeners();
  }
}
