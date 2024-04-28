class ShowProductPhotoParams{
  final int productId;

  ShowProductPhotoParams({required this.productId});

  Map<String,dynamic> toJson()=>{
    "product_id":productId ,

  };
}