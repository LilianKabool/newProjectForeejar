
import 'package:json_annotation/json_annotation.dart';

part 'get_category_attribute_entity.g.dart';

@JsonSerializable()
class GetCategoryAttributesEntity {
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data')
  final List<CategoryAttribute> data;

  GetCategoryAttributesEntity({required this.message, required this.data});

  factory GetCategoryAttributesEntity.fromJson(Map<String, dynamic> json) => _$GetCategoryAttributesEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetCategoryAttributesEntityToJson(this);
}

@JsonSerializable()
class CategoryAttribute {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'name_en')
  final String nameEn;
  @JsonKey(name: 'icon')
  final String icon;
  @JsonKey(name: 'data_type')
  final String dataType;
  @JsonKey(name: 'data_value')
  final String dataValue;
  @JsonKey(name: 'photo')
  final String? photo;

  CategoryAttribute({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.nameEn,
    required this.icon,
    required this.dataType,
    required this.dataValue,
    required this.photo,
  });

  factory CategoryAttribute.fromJson(Map<String, dynamic> json) => _$CategoryAttributeFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryAttributeToJson(this);
}
