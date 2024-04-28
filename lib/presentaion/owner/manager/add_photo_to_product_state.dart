
part of 'add_photo_to_product_cubit.dart';


@freezed
class AddPhotoToProductState with _$AddPhotoToProductState {
  const factory AddPhotoToProductState.initial() = _Initial;
  const factory AddPhotoToProductState.loading() = Loading;

  const factory AddPhotoToProductState.success(BaseEntity baseEntity) = Success;

  const factory AddPhotoToProductState.error(NetworkExceptions networkExceptions) =
      Error;}
