import 'package:flutter/foundation.dart';
import 'package:flutter_tv/common/dio_request.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:flutter_tv/models/video_response.dart';

const hotMovieIds = [
  44472, //闪电侠
  44174, //变形金刚
  45239, //碟中谍
  40626, //流浪地球
  40650, // 满江红
  43017, //灌篮高手
  // 42928, //忠犬八公
  // 42076, // 保你平安
  // 31756, // 四海
];

const hotTvIds = [
  42772, // 漫长的季节
  42963, // 平凡之路
  42475, // 长月烬明
  41732, // 黑暗荣耀
  40396, // 狂飙
  40174, // 重启人生
];
const hotVarietyIds = [
  42991, // 乘风2023
  41054, // 种地吧
  42767, // 奔跑吧 第七季
  40529, // 大侦探 第八季
  42524, // 青春环游记 第四季
  43111, // 来活了兄弟
];
const hotCartoonIds = [
  32742, // 海贼王
  33346, // 死神 千年血战篇
  42168, // 画江湖之不良人 第六季
  32192, // 凡人修仙传
  42684, // 鬼灭之刃 锻刀村篇
  32738, // 火影忍者：博人传之次世代继承者
];

class HomeModel extends ChangeNotifier {
  var movies = <Video>[];
  var tvs = <Video>[];
  var varieties = <Video>[];
  var cartoon = <Video>[];

  HomeModel() {
    fetchData();
  }

  fetchData() {
    List<Future<VideoResponse>> futures = [
      DioRequest().fetchHots(hotMovieIds),
      DioRequest().fetchHots(hotTvIds),
      DioRequest().fetchHots(hotVarietyIds),
      DioRequest().fetchHots(hotCartoonIds),
    ];
    return Future.wait(futures).then((value) {
      movies.addAll(value[0].list);
      tvs.addAll(value[1].list);
      varieties.addAll(value[2].list);
      cartoon.addAll(value[3].list);
      notifyListeners();
    });
  }
}
