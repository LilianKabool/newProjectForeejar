import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';

import '../../../core/params/update_product_params.dart';
import '../../../feature/owner/entity/base_entity.dart';
import '../../../feature/owner/repository/owner_respository.dart';
import '../../../network_exceptions.dart';

part 'update_product_state.dart';

part 'update_product_cubit.freezed.dart';

@injectable
class UpdateProductCubit extends Cubit<UpdateProductState> {
  final OwnerBaseRepository _ownerBaseRepository;

  UpdateProductCubit(this._ownerBaseRepository)
      : super(const UpdateProductState.initial());

  Future<void> emitUpdateProduct(
      {required UpdateProductParams updateProductParams}) async {
    emit(const UpdateProductState.loading());
    final response =
        await _ownerBaseRepository.updateProduct(updateProductParams);
    response.fold((l) => emit(UpdateProductState.error(l)),
        (r) => emit(UpdateProductState.success(r)));
  }

}
