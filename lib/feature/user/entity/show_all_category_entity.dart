import 'package:json_annotation/json_annotation.dart';

part 'show_all_category_entity.g.dart';

@JsonSerializable()
class ShowAllCategoryEntity {


factory ShowAllCategoryEntity.fromJson(Map<String, dynamic> json) =>
_$ShowAllCategoryEntityFromJson(json);

Map<String, dynamic> toJson() => _$ShowAllCategoryEntityToJson(this);

ShowAllCategoryEntity();
}