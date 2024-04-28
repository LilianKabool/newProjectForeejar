// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreOrderEntity _$StoreOrderEntityFromJson(Map<String, dynamic> json) =>
    StoreOrderEntity(
      message: json['message'] as String,
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoreOrderEntityToJson(StoreOrderEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'order': instance.order,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      productId: json['product_id'] as String,
      clientId: json['client_id'] as int,
      price: json['price'] as String,
      langCode: json['lang_code'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      status: json['status'] as int,
      addressDetails: json['address_details'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'product_id': instance.productId,
      'client_id': instance.clientId,
      'price': instance.price,
      'lang_code': instance.langCode,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'status': instance.status,
      'address_details': instance.addressDetails,
      'id': instance.id,
    };
