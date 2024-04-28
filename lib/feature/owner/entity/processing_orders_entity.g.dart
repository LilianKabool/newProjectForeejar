// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processing_orders_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcessingOrdersEntity _$ProcessingOrdersEntityFromJson(
        Map<String, dynamic> json) =>
    ProcessingOrdersEntity(
      json['message'] as String,
      (json['orders'] as List<dynamic>)
          .map((e) => OrderEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProcessingOrdersEntityToJson(
        ProcessingOrdersEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'orders': instance.orders,
    };

OrderEntity _$OrderEntityFromJson(Map<String, dynamic> json) => OrderEntity(
      json['id'] as int,
      json['status'] as int,
      json['address'] as String?,
      json['address_details'] as String,
      json['response'] as String?,
      json['price'] as int,
      json['lang_code'] as String,
      json['start_processing'] as String?,
      json['end_processing'] as String?,
      json['client_id'] as int,
      json['product_id'] as int,
      json['client_note'] as String?,
      json['owner_note'] as String?,
      json['start_date'] as String,
      json['end_date'] as String,
      json['accepted'] as int,
      json['rejected'] as int,
    );

Map<String, dynamic> _$OrderEntityToJson(OrderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'address': instance.address,
      'address_details': instance.addressDetails,
      'response': instance.response,
      'price': instance.price,
      'lang_code': instance.langCode,
      'start_processing': instance.startProcessing,
      'end_processing': instance.endProcessing,
      'client_id': instance.clientId,
      'product_id': instance.productId,
      'client_note': instance.clientNote,
      'owner_note': instance.ownerNote,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'accepted': instance.accepted,
      'rejected': instance.rejected,
    };
