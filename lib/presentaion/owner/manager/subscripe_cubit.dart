import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/params/subscripe_params.dart';
import '../../../feature/owner/entity/base_entity.dart';
import '../../../feature/owner/repository/owner_respository.dart';
import '../../../network_exceptions.dart';

part 'subscripe_state.dart';
part 'subscripe_cubit.freezed.dart';
@injectable
class SubscripeCubit extends Cubit<SubscripeState> {
final OwnerBaseRepository _ownerBaseRepository;
  SubscripeCubit(this._ownerBaseRepository) : super(const SubscripeState.initial());
  Future<void> emitSubscripe({required SubscripeParams subscripeParams})async{
    emit(const SubscripeState.loading());
    final response = await _ownerBaseRepository.subscripe(subscripeParams);
    response.fold((l) => emit(SubscripeState.error(l)), (r) => emit(SubscripeState.success(r)));
  }}
