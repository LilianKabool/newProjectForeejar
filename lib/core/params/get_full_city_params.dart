class GetFullCityParams{
  final int countryId;
   final int cityId;

  GetFullCityParams({required this.countryId, required this.cityId});


  Map<String,dynamic> toJson()=>{
    "country_id":countryId,
        "city_id":cityId

  };
}