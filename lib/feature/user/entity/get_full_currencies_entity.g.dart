// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_full_currencies_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFullCurrenciesEntity _$GetFullCurrenciesEntityFromJson(
        Map<String, dynamic> json) =>
    GetFullCurrenciesEntity(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CurrencyData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFullCurrenciesEntityToJson(
        GetFullCurrenciesEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

CurrencyData _$CurrencyDataFromJson(Map<String, dynamic> json) => CurrencyData(
      id: json['id'] as int,
      countryId: json['country_id'] as int,
      name: json['name'] as String,
      value: (json['value'] as num).toDouble(),
      country: json['country'] as String,
    );

Map<String, dynamic> _$CurrencyDataToJson(CurrencyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country_id': instance.countryId,
      'name': instance.name,
      'value': instance.value,
      'country': instance.country,
    };
