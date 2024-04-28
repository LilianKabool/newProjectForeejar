
part of 'rate_product_cubit.dart';

@freezed
class RateProductState with _$RateProductState {
  const factory RateProductState.initial() = _Initial;
  const factory RateProductState.loading() = Loading;

  const factory RateProductState.success(BaseOrderEntity baseOrderEntity) = Success;

  const factory RateProductState.error(NetworkExceptions networkExceptions) =
      Error;}
