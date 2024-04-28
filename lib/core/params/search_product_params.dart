class SearchProductParams {
  final String name;
  final int categoryId;
  final int regionId;
  final int cityId;
  final String orderingName;
  final String orderingDate;
  final String orderingNbOrders;


  SearchProductParams({
    required this.name,
    required this.categoryId,
    required this.regionId,
    required this.cityId,
    required this.orderingName,
    required this.orderingDate,
    required this.orderingNbOrders,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "category_id": categoryId,
    "region_id": regionId,
    "city_id": cityId,
    "ordering_name": orderingName,
    "ordering_date": orderingDate,
    "ordering_nb_orders": orderingNbOrders,

  };
}
