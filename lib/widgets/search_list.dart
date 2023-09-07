import 'package:flutter/material.dart';
import 'package:flutter_tv/common/constant.dart';
import 'package:flutter_tv/store/library.dart';
import 'package:flutter_tv/widgets/search_item.dart';
import 'package:provider/provider.dart';

class SearchList extends StatefulWidget {
  final void Function() fetchData;

  const SearchList({super.key, required this.fetchData});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        widget.fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var list = context.watch<LibraryModal>().list;
    var state = context.watch<LibraryModal>().state;
    return ListView.separated(
        controller: _scrollController,
        itemBuilder: (context, index) {
          if (index == list.length) {
            if (state == FetchState.finish) {
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            } else if (state == FetchState.loading) {
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Container();
            }
          } else {
            return SearchItem(video: list[index]);
          }
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: list.length + 1);
  }
}
