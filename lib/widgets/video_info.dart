import 'package:flutter/material.dart';
import 'package:flutter_tv/store/video.dart';
import 'package:provider/provider.dart';

class VideoInfo extends StatelessWidget {
  const VideoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var video = context.read<VideoModal>().video;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          video.vodName,
          style: const TextStyle(fontSize: 18),
        ),
        Image.network(video.vodPic),
        Text(
          "别名：${video.vodSub}",
          maxLines: 1,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
        Text(
          "标签：${video.vodTag}",
          maxLines: 1,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
        Text(
          "更新：${video.vodRemarks}/${video.vodTotal}",
          maxLines: 1,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
        Text(
          "更新时间：${video.vodTime}",
          maxLines: 1,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
        Text(
          "完结：${video.vodIsend == 0 ? '更新中' : '已完结'}",
          maxLines: 1,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
        Text(
          "语言：${video.vodLang}",
          maxLines: 1,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
        Text(
          "年份：${video.vodYear}",
          maxLines: 1,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
        Text(
          "分类：${video.typeName}",
          maxLines: 1,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
        Text(
          "区域：${video.vodArea}",
          maxLines: 1,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
        Text(
          "导演：${video.vodDirector}",
          maxLines: 1,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
        Text(
          "演员：${video.vodActor}",
          maxLines: 2,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
        Text(
          "简介：${video.vodContent}",
        ),
      ],
    );
  }
}
