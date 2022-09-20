// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      json['type_id'] as int,
      json['type_pid'] as int,
      json['type_name'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'type_id': instance.typeId,
      'type_pid': instance.typePid,
      'type_name': instance.typeName,
    };
