part of 'my_products_cubit.dart';

@freezed
class MyProductsState with _$MyProductsState {
    const factory MyProductsState.loading() = Loading;

  const factory MyProductsState.success(BaseMyProductEntity baseMyProductEntity) = Success;

  const factory MyProductsState.error(NetworkExceptions networkExceptions) =
      Error;}
