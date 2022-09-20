// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      json['vod_id'] as int,
      json['vod_name'] as String,
      json['type_id'] as int,
      json['type_name'] as String,
      json['vod_time'] as String,
      json['vod_play_from'] as String,
      json['type_id_1'] as int,
      json['vod_sub'] as String,
      json['vod_status'] as String,
      json['vod_tag'] as String,
      json['vod_pic'] as String,
      json['vod_actor'] as String,
      json['vod_director'] as String,
      json['vod_pubdate'] as String,
      json['vod_total'] as int,
      json['vod_area'] as String,
      json['vod_lang'] as String,
      json['vod_year'] as String,
      json['vod_isend'] as int,
      json['vod_remarks'] as String,
      json['vod_score'] as String,
      json['vod_douban_id'] as int,
      json['vod_douban_score'] as String,
      json['vod_content'] as String,
      json['vod_play_url'] as String,
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'vod_id': instance.vodId,
      'vod_name': instance.vodName,
      'type_id': instance.typeId,
      'type_name': instance.typeName,
      'vod_time': instance.vodTime,
      'vod_play_from': instance.vodPlayFrom,
      'type_id_1': instance.typeId1,
      'vod_sub': instance.vodSub,
      'vod_status': instance.vodStatus,
      'vod_tag': instance.vodTag,
      'vod_pic': instance.vodPic,
      'vod_actor': instance.vodActor,
      'vod_director': instance.vodDirector,
      'vod_pubdate': instance.vodPubdate,
      'vod_total': instance.vodTotal,
      'vod_area': instance.vodArea,
      'vod_lang': instance.vodLang,
      'vod_year': instance.vodYear,
      'vod_isend': instance.vodIsend,
      'vod_remarks': instance.vodRemarks,
      'vod_score': instance.vodScore,
      'vod_douban_id': instance.vodDoubanId,
      'vod_douban_score': instance.vodDoubanScore,
      'vod_content': instance.vodContent,
      'vod_play_url': instance.vodPlayUrl,
    };
