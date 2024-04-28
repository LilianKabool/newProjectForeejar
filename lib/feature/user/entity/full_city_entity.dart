import 'package:json_annotation/json_annotation.dart';

part 'full_city_entity.g.dart';

@JsonSerializable()
class FullCityEntity {
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data')
  final CityEntity city;

  FullCityEntity({required this.message, required this.city});

  factory FullCityEntity.fromJson(Map<String, dynamic> json) => _$FullCityEntityFromJson(json);
  Map<String, dynamic> toJson() => _$FullCityEntityToJson(this);
}

@JsonSerializable()
class CityEntity {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'country_id')
  final int countryId;
  @JsonKey(name: 'delete')
  final int delete;
  @JsonKey(name: 'name_en')
  final String nameEn;
  @JsonKey(name: 'regions')
  final List<RegionEntity> regions;

  CityEntity({required this.id, required this.name, required this.countryId, required this.delete, required this.nameEn, required this.regions});

  factory CityEntity.fromJson(Map<String, dynamic> json) => _$CityEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CityEntityToJson(this);
}

@JsonSerializable()
class RegionEntity {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'country_id')
  final int countryId;
  @JsonKey(name: 'city_id')
  final int cityId;
  @JsonKey(name: 'delete')
  final int delete;
  @JsonKey(name: 'name_en')
  final String nameEn;
  @JsonKey(name: 'ship_cost')
  final int shipCost;

  RegionEntity({required this.id, required this.name, required this.countryId, required this.cityId, required this.delete, required this.nameEn, required this.shipCost});

  factory RegionEntity.fromJson(Map<String, dynamic> json) => _$RegionEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RegionEntityToJson(this);
}