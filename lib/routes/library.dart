import 'package:flutter/material.dart';
import 'package:flutter_tv/common/constant.dart';
import 'package:flutter_tv/states/video_lib.dart';
import 'package:flutter_tv/widgets/search_list.dart';
import 'package:get/get.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: VideoLibController(),
      builder: (VideoLibController controller) {
        return Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SegmentedButton(
                emptySelectionAllowed: true,
                segments: level1Options
                    .map(
                        (e) => ButtonSegment(value: e.id, label: Text(e.label)))
                    .toList(),
                selected: {controller.selectedPid},
                onSelectionChanged: controller.onSelectionChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: controller.channelList.isNotEmpty
                    ? SegmentedButton(
                        emptySelectionAllowed: true,
                        segments: controller.channelList
                            .map((e) => ButtonSegment(
                                value: e.id, label: Text(e.label)))
                            .toList(),
                        selected: {controller.selectedId},
                        onSelectionChanged: controller.onChannelChanged,
                      )
                    : Container(),
              ),
            ),
            const Expanded(child: SearchList()),
          ],
        );
      },
    );
  }
}
