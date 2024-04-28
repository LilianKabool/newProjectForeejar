class GetSubscriptionParams{
  final int categoryId;

  GetSubscriptionParams({required this.categoryId});

Map<String,dynamic> toJson()=>{
  "category_id":categoryId
};
}