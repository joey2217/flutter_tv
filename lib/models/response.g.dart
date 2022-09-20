// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      (json['class'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['code'] as int,
      json['limit'] as int,
      (json['list'] as List<dynamic>)
          .map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['msg'] as String,
      json['page'] as int,
      json['pagecount'] as int,
      json['total'] as int,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'class': instance.categories,
      'code': instance.code,
      'limit': instance.limit,
      'list': instance.list,
      'msg': instance.msg,
      'page': instance.page,
      'pagecount': instance.pagecount,
      'total': instance.total,
    };
