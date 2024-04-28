import 'package:json_annotation/json_annotation.dart';

part 'show_product_photo_entity.g.dart';

@JsonSerializable()
class ShowProductPhotoEntity {
  ShowProductPhotoEntity();

factory ShowProductPhotoEntity.fromJson(Map<String, dynamic> json) =>
_$ShowProductPhotoEntityFromJson(json);

Map<String, dynamic> toJson() => _$ShowProductPhotoEntityToJson(this);
}