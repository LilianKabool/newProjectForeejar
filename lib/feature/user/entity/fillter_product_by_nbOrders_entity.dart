import 'package:json_annotation/json_annotation.dart';

part 'fillter_product_by_nbOrders_entity.g.dart';

@JsonSerializable()
class FillterProductByNbOrdersEntity {

  FillterProductByNbOrdersEntity();
factory FillterProductByNbOrdersEntity.fromJson(Map<String, dynamic> json) =>
_$FillterProductByNbOrdersEntityFromJson(json);

Map<String, dynamic> toJson() => _$FillterProductByNbOrdersEntityToJson(this);
}