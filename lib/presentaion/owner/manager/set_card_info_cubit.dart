import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/params/set_card_info_params.dart';
import '../../../feature/owner/entity/base_entity.dart';
import '../../../feature/owner/repository/owner_respository.dart';
import '../../../network_exceptions.dart';

part 'set_card_info_state.dart';
part 'set_card_info_cubit.freezed.dart';
@injectable
class SetCardInfoCubit extends Cubit<SetCardInfoState> {
final OwnerBaseRepository _ownerBaseRepository;
  SetCardInfoCubit(this._ownerBaseRepository) : super(const SetCardInfoState.initial());
  Future<void> emitSetCardInfo({required SetCardInfoParams setCardInfoParams})async{
    emit(const SetCardInfoState.loading());
    final response = await _ownerBaseRepository.setCardInfo(setCardInfoParams);
    response.fold((l) => emit(SetCardInfoState.error(l)), (r) => emit(SetCardInfoState.success(r)));
  }}
