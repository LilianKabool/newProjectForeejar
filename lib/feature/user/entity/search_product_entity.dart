import 'package:json_annotation/json_annotation.dart';

part 'search_product_entity.g.dart';

@JsonSerializable()
class SearchProductEntity {
  SearchProductEntity();
factory SearchProductEntity.fromJson(Map<String, dynamic> json) =>
_$SearchProductEntityFromJson(json);

Map<String, dynamic> toJson() => _$SearchProductEntityToJson(this);
}