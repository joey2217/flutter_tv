import 'package:json_annotation/json_annotation.dart'; 
  
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

  factory Category.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

}
