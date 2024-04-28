import 'dart:io';

class UpdateProductParams {
  final int productId;
  final String name;
  final String engilshName;
  final String description;
  final String englishDescription;
  final double price;
  final File photo;
  // final List<int> attributeIds;
  // final List<String> attributeValues;
  final int countryId;
  final int cityId;
  final String startDate;

  UpdateProductParams({
    required this.productId,
    required this.name,
    required this.engilshName,
    required this.description,
    required this.englishDescription,
    required this.price,
    required this.photo,
    // required this.attributeIds,
    // required this.attributeValues,
    required this.countryId,
    required this.cityId,
    required this.startDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'name': name,
      'name_en': engilshName,
      'description': description,
      'description_en': englishDescription,
      'price': price,
      'photo': photo.path,
      // 'attribute_ids': attributeIds,
      // 'attribute_value': attributeValues,
      'country_id': countryId,
      'city_id': cityId,
      'start_date': startDate,
    };
  }
}
