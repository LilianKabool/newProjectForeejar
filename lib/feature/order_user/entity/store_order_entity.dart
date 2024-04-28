import 'package:json_annotation/json_annotation.dart';

part 'store_order_entity.g.dart';

@JsonSerializable()
class StoreOrderEntity {
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'order')
  final Order order;

  StoreOrderEntity({required this.message, required this.order});

  factory StoreOrderEntity.fromJson(Map<String, dynamic> json) => _$StoreOrderEntityFromJson(json);
  Map<String, dynamic> toJson() => _$StoreOrderEntityToJson(this);
}

@JsonSerializable()
class Order {
  @JsonKey(name: 'product_id')
  final String productId;
  @JsonKey(name: 'client_id')
  final int clientId;
  @JsonKey(name: 'price')
  final String price;
  @JsonKey(name: 'lang_code')
  final String langCode;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String endDate;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'address_details')
  final String addressDetails;
  @JsonKey(name: 'id')
  final int id;

  Order({
    required this.productId,
    required this.clientId,
    required this.price,
    required this.langCode,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.addressDetails,
    required this.id,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}