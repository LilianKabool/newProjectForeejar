import 'package:json_annotation/json_annotation.dart';

part 'my_subscription_entity.g.dart';

@JsonSerializable()
class MySubscriptionEntity {
  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'subscriptions')
  final List<SubscriptionDataEntity> subscriptions;

  MySubscriptionEntity(this.message, this.subscriptions);

  factory MySubscriptionEntity.fromJson(Map<String, dynamic> json) =>
      _$MySubscriptionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MySubscriptionEntityToJson(this);
}

@JsonSerializable()
class SubscriptionDataEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'subscription_id')
  final int subscriptionId;

  @JsonKey(name: 'start_date')
  final String startDate;

  @JsonKey(name: 'end_date')
  final String endDate;

  @JsonKey(name: 'value')
  final int value;
  SubscriptionDataEntity(
    this.id,
    this.userId,
    this.subscriptionId,
    this.startDate,
    this.endDate,
    this.value,
  );

  factory SubscriptionDataEntity.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionDataEntityToJson(this);
}
