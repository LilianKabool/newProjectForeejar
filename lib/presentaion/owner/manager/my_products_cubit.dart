import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../feature/owner/entity/my_products_entity.dart';
import '../../../feature/owner/repository/owner_respository.dart';
import '../../../network_exceptions.dart';

part 'my_products_state.dart';
part 'my_products_cubit.freezed.dart';
@injectable
class MyProductsCubit extends Cubit<MyProductsState> {
final OwnerBaseRepository _ownerBaseRepository;
  MyProductsCubit(this._ownerBaseRepository) : super(const MyProductsState.loading());
  Future<void> emitGetMyProduct()async{
    emit(const MyProductsState.loading());
    final response = await _ownerBaseRepository.myProducts();
    response.fold((l) => emit(MyProductsState.error(l)), (r) => emit(MyProductsState.success(r)));
  }}
