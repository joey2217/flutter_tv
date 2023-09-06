// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResponse _$VideoResponseFromJson(Map<String, dynamic> json) =>
    VideoResponse(
      json['code'] as int,
      json['limit'] as String,
      (json['list'] as List<dynamic>)
          .map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['msg'] as String,
      json['page'] is int ? json['page'] : int.parse(json['page']),
      json['pagecount'] as int,
      json['total'] as int,
    );

Map<String, dynamic> _$VideoResponseToJson(VideoResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'limit': instance.limit,
      'list': instance.list,
      'msg': instance.msg,
      'page': instance.page,
      'pagecount': instance.pagecount,
      'total': instance.total,
    };
