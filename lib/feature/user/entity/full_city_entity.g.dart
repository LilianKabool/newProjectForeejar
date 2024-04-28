// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_city_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullCityEntity _$FullCityEntityFromJson(Map<String, dynamic> json) =>
    FullCityEntity(
      message: json['message'] as String,
      city: CityEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FullCityEntityToJson(FullCityEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.city,
    };

CityEntity _$CityEntityFromJson(Map<String, dynamic> json) => CityEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      countryId: json['country_id'] as int,
      delete: json['delete'] as int,
      nameEn: json['name_en'] as String,
      regions: (json['regions'] as List<dynamic>)
          .map((e) => RegionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityEntityToJson(CityEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.countryId,
      'delete': instance.delete,
      'name_en': instance.nameEn,
      'regions': instance.regions,
    };

RegionEntity _$RegionEntityFromJson(Map<String, dynamic> json) => RegionEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      countryId: json['country_id'] as int,
      cityId: json['city_id'] as int,
      delete: json['delete'] as int,
      nameEn: json['name_en'] as String,
      shipCost: json['ship_cost'] as int,
    );

Map<String, dynamic> _$RegionEntityToJson(RegionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.countryId,
      'city_id': instance.cityId,
      'delete': instance.delete,
      'name_en': instance.nameEn,
      'ship_cost': instance.shipCost,
    };
