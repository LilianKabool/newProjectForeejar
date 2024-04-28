part of 'get_full_countries_cubit.dart';

@freezed
class GetFullCountriesState with _$GetFullCountriesState {
  const factory GetFullCountriesState.loading() = Loading;

  const factory GetFullCountriesState.success(GetFullCountriesEntity getFullCountriesEntity) = Success;

  const factory GetFullCountriesState.error(NetworkExceptions networkExceptions) =
      Error;}
