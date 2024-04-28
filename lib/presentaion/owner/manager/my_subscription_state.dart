part of 'my_subscription_cubit.dart';

@freezed
class MySubscriptionState with _$MySubscriptionState {

    const factory MySubscriptionState.loading() = Loading;

  const factory MySubscriptionState.success(MySubscriptionEntity mySubscriptionsEntity) = Success;

  const factory MySubscriptionState.error(NetworkExceptions networkExceptions) =
      Error;
}
