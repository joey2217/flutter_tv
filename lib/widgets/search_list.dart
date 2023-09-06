import 'package:flutter/material.dart';
import 'package:flutter_tv/common/constant.dart';
import 'package:flutter_tv/states/video_lib.dart';
import 'package:flutter_tv/widgets/search_item.dart';
import 'package:get/get.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var controller = VideoLibController.to;
      if (controller.state != FetchState.finish &&
          _scrollController.position.atEdge) {
        controller.fetchNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (VideoLibController controller) {
      return ListView.separated(
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index == controller.list.length) {
              if (controller.state == FetchState.finish) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              } else if (controller.state == FetchState.loading) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: const SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0),
                  ),
                );
              } else {
                return Container();
              }
            } else {
              return SearchItem(video: controller.list[index]);
            }
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: controller.list.length + 1);
    });
  }
}
