import 'package:json_annotation/json_annotation.dart'; 
  
part 'entity.g.dart';


@JsonSerializable()
  class Entity extends Object with _$EntitySerializerMixin{

  @JsonKey(name: 'class')
  List<Class> class;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'limit')
  int limit;

  @JsonKey(name: 'list')
  List<List> list;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'pagecount')
  int pagecount;

  @JsonKey(name: 'total')
  int total;

  Entity(this.class,this.code,this.limit,this.list,this.msg,this.page,this.pagecount,this.total,);

  factory Entity.fromJson(Map<String, dynamic> srcJson) => _$EntityFromJson(srcJson);

}

  
@JsonSerializable()
  class Class extends Object with _$ClassSerializerMixin{

  @JsonKey(name: 'type_id')
  int typeId;

  @JsonKey(name: 'type_pid')
  int typePid;

  @JsonKey(name: 'type_name')
  String typeName;

  Class(this.typeId,this.typePid,this.typeName,);

  factory Class.fromJson(Map<String, dynamic> srcJson) => _$ClassFromJson(srcJson);

}

  
@JsonSerializable()
  class List extends Object with _$ListSerializerMixin{

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

  List(this.vodId,this.vodName,this.typeId,this.typeName,this.vodTime,this.vodPlayFrom,this.typeId1,this.vodSub,this.vodStatus,this.vodTag,this.vodPic,this.vodActor,this.vodDirector,this.vodPubdate,this.vodTotal,this.vodArea,this.vodLang,this.vodYear,this.vodIsend,this.vodRemarks,this.vodScore,this.vodDoubanId,this.vodDoubanScore,this.vodContent,this.vodPlayUrl,);

  factory List.fromJson(Map<String, dynamic> srcJson) => _$ListFromJson(srcJson);

}

  
