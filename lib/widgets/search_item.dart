import 'package:flutter/material.dart';
import 'package:flutter_tv/models/video.dart';

class SearchItem extends StatelessWidget {
  final Video video;

  const SearchItem({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(video.vodName),
    );
  }
}
