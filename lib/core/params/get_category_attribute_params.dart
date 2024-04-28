class GetCategoryAttributeParams{
  final int categoryId;

  GetCategoryAttributeParams({required this.categoryId});

  Map<String,dynamic> toJson()=>{
    "category_id":categoryId
  };
}