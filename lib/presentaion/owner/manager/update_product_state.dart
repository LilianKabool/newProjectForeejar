
part of 'update_product_cubit.dart';


@freezed
class UpdateProductState with _$UpdateProductState {
  const factory UpdateProductState.initial() = _Initial;
  const factory UpdateProductState.loading() = Loading;

  const factory UpdateProductState.success(BaseEntity baseEntity) = Success;

  const factory UpdateProductState.error(NetworkExceptions networkExceptions) =
      Error;}
