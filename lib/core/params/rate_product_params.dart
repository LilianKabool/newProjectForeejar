class RateProductParams{
  final int rate;
  final int productId;

  RateProductParams({required this.rate, required this.productId});


Map<String,dynamic>toJson()=>{
  "product_id":productId,
  "rating":rate
};
}