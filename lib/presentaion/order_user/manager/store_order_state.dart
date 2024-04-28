part of 'store_order_cubit.dart';

@freezed
class StoreOrderState with _$StoreOrderState {
  const factory StoreOrderState.initial() = _Initial;
  const factory StoreOrderState.loading() = Loading;

  const factory StoreOrderState.success(StoreOrderEntity storeOrderEntity) = Success;

  const factory StoreOrderState.error(NetworkExceptions networkExceptions) =
      Error;}
