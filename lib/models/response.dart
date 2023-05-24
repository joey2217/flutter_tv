import 'package:flutter_tv/models/category.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class Response {
  @JsonKey(name: 'class')
  List<Category> categories;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'limit')
  int limit;

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

  Response(
    this.categories,
    this.code,
    this.limit,
    this.list,
    this.msg,
    this.page,
    this.pagecount,
    this.total,
  );

  factory Response.fromJson(Map<String, dynamic> srcJson) =>
      _$ResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
