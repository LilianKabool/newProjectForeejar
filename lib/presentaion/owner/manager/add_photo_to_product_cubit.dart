import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../core/params/add_photo_to_product_params.dart';
import '../../../feature/owner/entity/base_entity.dart';
import '../../../feature/owner/repository/owner_respository.dart';
import '../../../network_exceptions.dart';

part 'add_photo_to_product_state.dart';
part 'add_photo_to_product_cubit.freezed.dart';
@injectable
class AddPhotoToProductCubit extends Cubit<AddPhotoToProductState> {
final OwnerBaseRepository _ownerBaseRepository;
  AddPhotoToProductCubit(this._ownerBaseRepository) : super(const AddPhotoToProductState.initial());
  Future<void> emitAddPhotoToProduct({required AddPhotoToProductParams addPhotoToProductParams})async{
    emit(const AddPhotoToProductState.loading());
    final response = await _ownerBaseRepository.addPhotoToProduct(addPhotoToProductParams);
    response.fold((l) => emit(AddPhotoToProductState.error(l)), (r) => emit(AddPhotoToProductState.success(r)));
  }}
