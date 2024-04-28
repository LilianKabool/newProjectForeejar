class GetFullCountryParams{
  final int countryId;

  GetFullCountryParams({required this.countryId});

  Map<String,dynamic> toJson()=>{
    "country_id":countryId
  };
}