part of 'get_category_attributes_cubit.dart';

@freezed
class GetCategoryAttributesState with _$GetCategoryAttributesState {
  const factory GetCategoryAttributesState.initial() = _Initial;
  const factory GetCategoryAttributesState.loading() = Loading;

  const factory GetCategoryAttributesState.success(GetCategoryAttributesEntity getCategoryAttributesEntity) = Success;

  const factory GetCategoryAttributesState.error(NetworkExceptions networkExceptions) =
      Error;}
