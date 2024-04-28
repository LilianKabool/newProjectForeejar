class StoreOrderParams{
  final int productId;
  final String? addressDetails;
  final String startDate;
  final String endDate;
  final String? clientNote;

  StoreOrderParams({required this.productId, required this.addressDetails, required this.startDate, required this.endDate, required this.clientNote});

Map<String,dynamic> toJson()=>{
  "product_id":productId,
  "address_details":addressDetails,
  "start_date":startDate,
  "end_date":endDate,
  "client_note":clientNote
};
}