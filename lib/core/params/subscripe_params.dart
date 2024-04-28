class SubscripeParams{
  final int subscriptionId;

  SubscripeParams({required this.subscriptionId});

  Map<String,dynamic>toJson()=>{
  "subscription_id":subscriptionId
};
}