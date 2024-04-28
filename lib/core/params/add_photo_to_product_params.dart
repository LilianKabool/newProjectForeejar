import 'dart:io';

class AddPhotoToProductParams{
  final int productId;
  final File photo;

  AddPhotoToProductParams({required this.productId, required this.photo});
  Map<String,dynamic>toJson()=>{
  "product_id":productId,
  "photo":photo
};
}