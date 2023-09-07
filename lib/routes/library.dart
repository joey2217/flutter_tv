import 'package:flutter/material.dart';
import 'package:flutter_tv/common/constant.dart';
import 'package:flutter_tv/store/library.dart';
import 'package:flutter_tv/widgets/search_list.dart';
import 'package:provider/provider.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    var channelList = context.watch<LibraryModal>().channelList;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SegmentedButton(
              emptySelectionAllowed: true,
              segments: level1Options
                  .map((e) => ButtonSegment(value: e.id, label: Text(e.label)))
                  .toList(),
              selected: {context.watch<LibraryModal>().selectedPid},
              onSelectionChanged:
                  context.read<LibraryModal>().onSelectionChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: channelList.isNotEmpty
                  ? SegmentedButton(
                      emptySelectionAllowed: true,
                      segments: channelList
                          .map((e) =>
                              ButtonSegment(value: e.id, label: Text(e.label)))
                          .toList(),
                      selected: {context.watch<LibraryModal>().selectedId},
                      onSelectionChanged:
                          context.read<LibraryModal>().onChannelChanged,
                    )
                  : Container(),
            ),
          ),
          Expanded(
              child: SearchList(
            fetchData: context.read<LibraryModal>().fetchNextPage,
          )),
        ],
      ),
    );
  }
}
