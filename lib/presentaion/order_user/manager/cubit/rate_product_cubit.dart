import 'package:bloc/bloc.dart';


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/rate_product_params.dart';
import '../../../../feature/order_user/entity/base_order_entity.dart';
import '../../../../feature/order_user/repository/order_repository.dart';
import '../../../../network_exceptions.dart';

part 'rate_product_state.dart';
part 'rate_product_cubit.freezed.dart';
@injectable
class RateProductCubit extends Cubit<RateProductState> {
final OrderBaseRepository _orderBaseRepository;
  RateProductCubit(this._orderBaseRepository) : super(const RateProductState.initial());
  Future<void> emitgetFullCountries({required RateProductParams rateProductParams})async{
    emit(const RateProductState.loading());
    final response = await _orderBaseRepository.rateProduct(rateProductParams);
    response.fold((l) => emit(RateProductState.error(l)), (r) => emit(RateProductState.success(r)));
  }}
