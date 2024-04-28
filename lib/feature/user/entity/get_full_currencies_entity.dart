import 'package:json_annotation/json_annotation.dart';

part 'get_full_currencies_entity.g.dart';

@JsonSerializable()
class GetFullCurrenciesEntity {
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data')
  final List<CurrencyData> data;

  GetFullCurrenciesEntity({required this.message, required this.data});

  factory GetFullCurrenciesEntity.fromJson(Map<String, dynamic> json) => _$GetFullCurrenciesEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetFullCurrenciesEntityToJson(this);
}

@JsonSerializable()
class CurrencyData {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'country_id')
  final int countryId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'value')
  final double value;

  @JsonKey(name: 'country')
  final String country;

  CurrencyData({
    required this.id,
    required this.countryId,
    required this.name,
    required this.value,
    required this.country,
  });

  factory CurrencyData.fromJson(Map<String, dynamic> json) => _$CurrencyDataFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyDataToJson(this);
}