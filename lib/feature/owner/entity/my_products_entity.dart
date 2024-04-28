import 'package:json_annotation/json_annotation.dart';
part 'my_products_entity.g.dart';

@JsonSerializable()
class BaseMyProductEntity{
  @JsonKey(name: "message")
  final String message;
    @JsonKey(name: "data")
  final List<ProductEntity> products;

  BaseMyProductEntity(this.message, this.products);

   factory BaseMyProductEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseMyProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BaseMyProductEntityToJson(this);
}
@JsonSerializable()
class ProductEntity {
  @JsonKey(name: 'product')
  final ProductData productData;

  ProductEntity(this.productData);

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductEntityToJson(this);
}

@JsonSerializable()
class ProductData {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'country_id')
  final int countryId;
  @JsonKey(name: 'city_id')
  final int cityId;
  @JsonKey(name: 'region_id')
  final int regionId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'name_en')
  final String englishName;
  @JsonKey(name: 'price')
  final String price;
  @JsonKey(name: 'active')
  final int active;
  @JsonKey(name: 'locked')
  final int locked;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'description_en')
  final String englishDescription;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String? endDate;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'image')
  final String image;
  @JsonKey(name: 'price_unit')
  final String priceUnit;
  @JsonKey(name: 'country_name')
  final String countryName;
  @JsonKey(name: 'country_name_en')
  final String englishCountryName;
  @JsonKey(name: 'city_name')
  final String cityName;
  @JsonKey(name: 'city_name_en')
  final String englishCityName;
  @JsonKey(name: 'region_name')
  final String regionName;
  @JsonKey(name: 'region_name_en')
  final String englishRegionName;
  @JsonKey(name: "photos")
  final List<Photo> photos;
  //   @JsonKey(name: "reservedDates")
  // final List<ReservedDate> reservedDates;
  @JsonKey(name: "attributes")
  final List<Attribute> attributes;
  ProductData(this.id, this.userId, this.countryId, this.cityId, this.regionId, this.name, this.englishName, this.price, this.active, this.locked, this.description, this.englishDescription, this.startDate, this.endDate, this.categoryId, this.image, this.priceUnit, this.countryName, this.englishCountryName, this.cityName, this.englishCityName, this.regionName, this.englishRegionName, this.photos, this.attributes);

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);


  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}

@JsonSerializable()
class Attribute {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: 'product_id')
  final int productId;
  @JsonKey(name: 'attribute_id')
  final int attributeId;
    @JsonKey(name: 'value')

  final String value;
    @JsonKey(name: 'name')

  final String name;
  @JsonKey(name: 'name_en')
  final String englishName;
  @JsonKey(name: 'data_type')
  final String dataType;
  @JsonKey(name: 'data_value')
  final String dataValue;
    @JsonKey(name: 'icon')

  final String icon;


  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Attribute(this.id, this.productId, this.attributeId, this.value, this.name, this.englishName, this.dataType, this.dataValue, this.icon);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}
@JsonSerializable()
class Photo {
    @JsonKey(name: 'id')

  final int id;
  @JsonKey(name: 'product_id')
  final int productId;
    @JsonKey(name: 'photo')

  final String photo;

  Photo(this.id, this.productId, this.photo);

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
///Todo:make this when see it after make the ui 
// @JsonSerializable()
// class ReservedDate{
// ReservedDate._();
//    factory ReservedDate.fromJson(Map<String, dynamic> json) =>
//       _$ReservedDateFromJson(json);

//   Map<String, dynamic> toJson() => _$ReservedDateToJson(this);
// }