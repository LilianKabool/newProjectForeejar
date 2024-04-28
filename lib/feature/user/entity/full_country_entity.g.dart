// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_country_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullCountryEntity _$FullCountryEntityFromJson(Map<String, dynamic> json) =>
    FullCountryEntity(
      message: json['message'] as String,
      data: CountryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FullCountryEntityToJson(FullCountryEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

CountryData _$CountryDataFromJson(Map<String, dynamic> json) => CountryData(
      country: CountryEntity.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryDataToJson(CountryData instance) =>
    <String, dynamic>{
      'country': instance.country,
    };

CountryEntity _$CountryEntityFromJson(Map<String, dynamic> json) =>
    CountryEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      delete: json['delete'] as int,
      cities: (json['cities'] as List<dynamic>)
          .map((e) => CityData.fromJson(e as Map<String, dynamic>))
          .toList(),
      englishName: json['name_en'] as String,
    );

Map<String, dynamic> _$CountryEntityToJson(CountryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'delete': instance.delete,
      'cities': instance.cities,
      'name_en': instance.englishName,
    };

CityData _$CityDataFromJson(Map<String, dynamic> json) => CityData(
      city: CityEntity.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityDataToJson(CityData instance) => <String, dynamic>{
      'city': instance.city,
    };

CityEntity _$CityEntityFromJson(Map<String, dynamic> json) => CityEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      countryId: json['country_id'] as int,
      delete: json['delete'] as int,
      englishName: json['name_en'] as String,
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
      'name_en': instance.englishName,
      'regions': instance.regions,
    };

RegionEntity _$RegionEntityFromJson(Map<String, dynamic> json) => RegionEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      countryId: json['country_id'] as int,
      cityId: json['city_id'] as int,
      delete: json['delete'] as int,
      englishName: json['name_en'] as String,
      shipCost: json['ship_cost'] as int,
    );

Map<String, dynamic> _$RegionEntityToJson(RegionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.countryId,
      'city_id': instance.cityId,
      'delete': instance.delete,
      'name_en': instance.englishName,
      'ship_cost': instance.shipCost,
    };
