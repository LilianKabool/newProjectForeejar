// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_products_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseMyProductEntity _$BaseMyProductEntityFromJson(Map<String, dynamic> json) =>
    BaseMyProductEntity(
      json['message'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => ProductEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BaseMyProductEntityToJson(
        BaseMyProductEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.products,
    };

ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) =>
    ProductEntity(
      ProductData.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductEntityToJson(ProductEntity instance) =>
    <String, dynamic>{
      'product': instance.productData,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      json['id'] as int,
      json['user_id'] as int,
      json['country_id'] as int,
      json['city_id'] as int,
      json['region_id'] as int,
      json['name'] as String,
      json['name_en'] as String,
      json['price'] as String,
      json['active'] as int,
      json['locked'] as int,
      json['description'] as String,
      json['description_en'] as String,
      json['start_date'] as String,
      json['end_date'] as String?,
      json['category_id'] as int,
      json['image'] as String,
      json['price_unit'] as String,
      json['country_name'] as String,
      json['country_name_en'] as String,
      json['city_name'] as String,
      json['city_name_en'] as String,
      json['region_name'] as String,
      json['region_name_en'] as String,
      (json['photos'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['attributes'] as List<dynamic>)
          .map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'country_id': instance.countryId,
      'city_id': instance.cityId,
      'region_id': instance.regionId,
      'name': instance.name,
      'name_en': instance.englishName,
      'price': instance.price,
      'active': instance.active,
      'locked': instance.locked,
      'description': instance.description,
      'description_en': instance.englishDescription,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'category_id': instance.categoryId,
      'image': instance.image,
      'price_unit': instance.priceUnit,
      'country_name': instance.countryName,
      'country_name_en': instance.englishCountryName,
      'city_name': instance.cityName,
      'city_name_en': instance.englishCityName,
      'region_name': instance.regionName,
      'region_name_en': instance.englishRegionName,
      'photos': instance.photos,
      'attributes': instance.attributes,
    };

Attribute _$AttributeFromJson(Map<String, dynamic> json) => Attribute(
      json['id'] as int,
      json['product_id'] as int,
      json['attribute_id'] as int,
      json['value'] as String,
      json['name'] as String,
      json['name_en'] as String,
      json['data_type'] as String,
      json['data_value'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'attribute_id': instance.attributeId,
      'value': instance.value,
      'name': instance.name,
      'name_en': instance.englishName,
      'data_type': instance.dataType,
      'data_value': instance.dataValue,
      'icon': instance.icon,
    };

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      json['id'] as int,
      json['product_id'] as int,
      json['photo'] as String,
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'photo': instance.photo,
    };
