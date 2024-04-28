
import 'package:json_annotation/json_annotation.dart';

part 'base_order_entity.g.dart';

@JsonSerializable()
class BaseOrderEntity{
  @JsonKey(name: "message")
  final String message;

  BaseOrderEntity({required this.message});

  factory BaseOrderEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseOrderEntityFromJson(json);


  Map<String, dynamic> toJson() => _$BaseOrderEntityToJson(this);
}
