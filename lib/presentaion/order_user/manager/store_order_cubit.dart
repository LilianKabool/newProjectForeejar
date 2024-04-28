import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/params/store_order_params.dart';
import '../../../feature/order_user/entity/store_order_entity.dart';
import '../../../feature/order_user/repository/order_repository.dart';
import '../../../network_exceptions.dart';

part 'store_order_state.dart';
part 'store_order_cubit.freezed.dart';
@injectable
class StoreOrderCubit extends Cubit<StoreOrderState> {
final OrderBaseRepository _orderBaseRepository;
  StoreOrderCubit(this._orderBaseRepository) : super(const StoreOrderState.initial());
  Future<void> emitgetFullCountries({required StoreOrderParams storeOrderParams})async{
    emit(const StoreOrderState.loading());
    final response = await _orderBaseRepository.storeOrder(storeOrderParams);
    response.fold((l) => emit(StoreOrderState.error(l)), (r) => emit(StoreOrderState.success(r)));
  }}
