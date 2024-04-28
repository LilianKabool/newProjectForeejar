part of 'get_full_currencies_cubit.dart';

@freezed
class GetFullCurrenciesState with _$GetFullCurrenciesState {
  const factory GetFullCurrenciesState.loading() = Loading;

  const factory GetFullCurrenciesState.success(GetFullCurrenciesEntity getFullCurrenciesEntity) = Success;

  const factory GetFullCurrenciesState.error(NetworkExceptions networkExceptions) =
      Error;}
