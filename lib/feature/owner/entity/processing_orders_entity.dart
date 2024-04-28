import 'package:json_annotation/json_annotation.dart';

part 'processing_orders_entity.g.dart';

@JsonSerializable()
class ProcessingOrdersEntity {
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'orders')
  final List<OrderEntity> orders;

  ProcessingOrdersEntity(this.message, this.orders);

  factory ProcessingOrdersEntity.fromJson(Map<String, dynamic> json) =>
      _$ProcessingOrdersEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessingOrdersEntityToJson(this);
}

@JsonSerializable()
class OrderEntity {
        @JsonKey(name: 'id')

  final int id;
      @JsonKey(name: 'status')

  final int status;
    @JsonKey(name: 'address')

  final String? address;
  @JsonKey(name: 'address_details')
  final String addressDetails;
        @JsonKey(name: 'response')

  final String? response;
    @JsonKey(name: 'price')

  final int price;
  @JsonKey(name: 'lang_code')
  final String langCode;
  @JsonKey(name: 'start_processing')
  final String? startProcessing;
  @JsonKey(name: 'end_processing')
  final String? endProcessing;
  @JsonKey(name: 'client_id')
  final int clientId;
  @JsonKey(name: 'product_id')
  final int productId;
  @JsonKey(name: 'client_note')
  final String? clientNote;
  @JsonKey(name: 'owner_note')
  final String? ownerNote;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String endDate;
    @JsonKey(name: 'accepted')

  final int accepted;
      @JsonKey(name: 'rejected')

  final int rejected;

  OrderEntity(
      this.id,
      this.status,
      this.address,
      this.addressDetails,
      this.response,
      this.price,
      this.langCode,
      this.startProcessing,
      this.endProcessing,
      this.clientId,
      this.productId,
      this.clientNote,
      this.ownerNote,
      this.startDate,
      this.endDate,
      this.accepted,
      this.rejected);

  factory OrderEntity.fromJson(Map<String, dynamic> json) => _$OrderEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OrderEntityToJson(this);
}
