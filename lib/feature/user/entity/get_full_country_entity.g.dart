// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_full_country_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFullCountriesEntity _$GetFullCountriesEntityFromJson(
        Map<String, dynamic> json) =>
    GetFullCountriesEntity(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CountryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFullCountriesEntityToJson(
        GetFullCountriesEntity instance) =>
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
      englishName: json['englishName'] as String,
    );

Map<String, dynamic> _$CountryEntityToJson(CountryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'delete': instance.delete,
      'cities': instance.cities,
      'englishName': instance.englishName,
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
      englishName: json['englishName'] as String,
      regions: (json['regions'] as List<dynamic>)
          .map((e) => Region.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityEntityToJson(CityEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.countryId,
      'delete': instance.delete,
      'englishName': instance.englishName,
      'regions': instance.regions,
    };

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      id: json['id'] as int,
      name: json['name'] as String,
      countryId: json['country_id'] as int,
      cityId: json['city_id'] as int,
      delete: json['delete'] as int,
      englishName: json['englishName'] as String,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.countryId,
      'city_id': instance.cityId,
      'delete': instance.delete,
      'englishName': instance.englishName,
    };
