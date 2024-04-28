// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_attribute_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoryAttributesEntity _$GetCategoryAttributesEntityFromJson(
        Map<String, dynamic> json) =>
    GetCategoryAttributesEntity(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CategoryAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCategoryAttributesEntityToJson(
        GetCategoryAttributesEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

CategoryAttribute _$CategoryAttributeFromJson(Map<String, dynamic> json) =>
    CategoryAttribute(
      id: json['id'] as int,
      categoryId: json['category_id'] as int,
      name: json['name'] as String,
      nameEn: json['name_en'] as String,
      icon: json['icon'] as String,
      dataType: json['data_type'] as String,
      dataValue: json['data_value'] as String,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$CategoryAttributeToJson(CategoryAttribute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.name,
      'name_en': instance.nameEn,
      'icon': instance.icon,
      'data_type': instance.dataType,
      'data_value': instance.dataValue,
      'photo': instance.photo,
    };
