import 'package:flutter_tv/models/video.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_response.g.dart';

@JsonSerializable()
class VideoResponse {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'limit')
  String limit;

  @JsonKey(name: 'list')
  List<Video> list;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'pagecount')
  int pagecount;

  @JsonKey(name: 'total')
  int total;

  VideoResponse(
    this.code,
    this.limit,
    this.list,
    this.msg,
    this.page,
    this.pagecount,
    this.total,
  );

  factory VideoResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$VideoResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoResponseToJson(this);
}
