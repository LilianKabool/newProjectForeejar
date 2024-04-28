import 'package:json_annotation/json_annotation.dart';

part 'subscriptions_entity.g.dart';

@JsonSerializable()
class BaseSubscriptionsEntity {
  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "subscriptions")
  final List<SubscriptionEntity> subscriptions;

  BaseSubscriptionsEntity(this.message, this.subscriptions);

  factory BaseSubscriptionsEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseSubscriptionsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BaseSubscriptionsEntityToJson(this);
}

@JsonSerializable()
class SubscriptionEntity {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "admin_id")
  final int adminId;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "title_en")
  final String englishTitle;

  @JsonKey(name: "duration")
  final int duration;

  @JsonKey(name: "price")
  final int price;

  @JsonKey(name: "deleted")
  final int deleted;

  SubscriptionEntity(
    this.id,
    this.adminId,
    this.title,
    this.englishTitle,
    this.duration,
    this.price,
    this.deleted,
  );

  factory SubscriptionEntity.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionEntityToJson(this);
}
