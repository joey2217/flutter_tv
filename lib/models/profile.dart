import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

enum AppTheme { system, light, dark }

@JsonSerializable()
class Profile {
  @JsonKey(name: 'theme')
  AppTheme theme;

  Profile(
    this.theme,
  );

  factory Profile.fromJson(Map<String, dynamic> srcJson) =>
      _$ProfileFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
