import 'package:json_annotation/json_annotation.dart';

part 'display_Ads_entity.g.dart';

@JsonSerializable()
class DisplayAdsEntity {



  DisplayAdsEntity();
  factory DisplayAdsEntity.fromJson(Map<String, dynamic> json) =>
      _$DisplayAdsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DisplayAdsEntityToJson(this);
}