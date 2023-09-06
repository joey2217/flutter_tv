// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      $enumDecodeNullable(_$BrightnessEnumMap, json['brightness']),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'brightness': _$BrightnessEnumMap[instance.brightness],
    };

const _$BrightnessEnumMap = {
  Brightness.dark: 'dark',
  Brightness.light: 'light',
};
