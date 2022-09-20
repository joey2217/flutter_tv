import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: 'type_id')
  int typeId;

  @JsonKey(name: 'type_pid')
  int typePid;

  @JsonKey(name: 'type_name')
  String typeName;

  Category(
    this.typeId,
    this.typePid,
    this.typeName,
  );

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
