import 'package:json_annotation/json_annotation.dart'; 

part 'video.g.dart';

@JsonSerializable()
class Video {
  @JsonKey(name: 'vod_id')
  int vodId;

  @JsonKey(name: 'vod_name')
  String vodName;

  @JsonKey(name: 'type_id')
  int typeId;

  @JsonKey(name: 'type_name')
  String typeName;

  @JsonKey(name: 'vod_time')
  String vodTime;

  @JsonKey(name: 'vod_play_from')
  String vodPlayFrom;

  @JsonKey(name: 'type_id_1')
  int typeId1;

  @JsonKey(name: 'vod_sub')
  String vodSub;

  @JsonKey(name: 'vod_status')
  String vodStatus;

  @JsonKey(name: 'vod_tag')
  String vodTag;

  @JsonKey(name: 'vod_pic')
  String vodPic;

  @JsonKey(name: 'vod_actor')
  String vodActor;

  @JsonKey(name: 'vod_director')
  String vodDirector;

  @JsonKey(name: 'vod_pubdate')
  String vodPubdate;

  @JsonKey(name: 'vod_total')
  int vodTotal;

  @JsonKey(name: 'vod_area')
  String vodArea;

  @JsonKey(name: 'vod_lang')
  String vodLang;

  @JsonKey(name: 'vod_year')
  String vodYear;

  @JsonKey(name: 'vod_isend')
  int vodIsend;

  @JsonKey(name: 'vod_remarks')
  String vodRemarks;

  @JsonKey(name: 'vod_score')
  String vodScore;

  @JsonKey(name: 'vod_douban_id')
  int vodDoubanId;

  @JsonKey(name: 'vod_douban_score')
  String vodDoubanScore;

  @JsonKey(name: 'vod_content')
  String vodContent;

  @JsonKey(name: 'vod_play_url')
  String vodPlayUrl;

  Video(
    this.vodId,
    this.vodName,
    this.typeId,
    this.typeName,
    this.vodTime,
    this.vodPlayFrom,
    this.typeId1,
    this.vodSub,
    this.vodStatus,
    this.vodTag,
    this.vodPic,
    this.vodActor,
    this.vodDirector,
    this.vodPubdate,
    this.vodTotal,
    this.vodArea,
    this.vodLang,
    this.vodYear,
    this.vodIsend,
    this.vodRemarks,
    this.vodScore,
    this.vodDoubanId,
    this.vodDoubanScore,
    this.vodContent,
    this.vodPlayUrl,
  );

  factory Video.fromJson(Map<String, dynamic> srcJson) =>
      _$VideoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

}
