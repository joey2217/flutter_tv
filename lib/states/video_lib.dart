import 'package:flutter/material.dart';
import 'package:flutter_tv/common/constant.dart';
import 'package:flutter_tv/common/dio_request.dart';
import 'package:flutter_tv/models/channel.dart';
import 'package:flutter_tv/models/search_param.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:get/get.dart';

class VideoLibController extends GetxController {
  int selectedPid = 1;
  int selectedId = 20;
  SearchParam param = SearchParam(null, null, 1);
  List<Channel> channelList =
      channelOptions.where((element) => element.pId == 1).toList();

  FetchState state = FetchState.init;

  List<Video> list = [];

  static VideoLibController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchSearchData();
  }

  Future fetchSearchData() async {
    if (state == FetchState.finish) {
      debugPrint('END');
      return;
    }
    state = FetchState.loading;
    var res = await DioRequest().fetchSearchVideos(param);
    list.addAll(res.list);
    if (res.page >= res.pagecount) {
      state = FetchState.finish;
    } else {
      state = FetchState.init;
    }
    update();
  }

  fetchNextPage() {
    param.nextPage();
    fetchSearchData();
  }

  search(String searchKey) {
    param.search(searchKey);
    list.clear();
    fetchSearchData();
  }

  onSelectionChanged(Set<int> newSelection) {
    selectedPid = newSelection.first;
    if (selectedPid == 27) {
      channelList = [];
      selectedId = 27;
    } else {
      channelList = channelOptions
          .where((element) => element.pId == selectedPid)
          .toList();
      selectedId = channelList[0].id;
    }
    update();
  }

  onChannelChanged(Set<int> newSelection) {
    selectedId = newSelection.first;
    update();
  }
}
