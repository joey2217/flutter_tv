import 'package:flutter_tv/models/category.dart';
import 'package:flutter_tv/models/video.dart';
import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'response.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
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

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
