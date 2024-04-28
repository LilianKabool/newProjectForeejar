import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../feature/owner/entity/active_subscruption_entity.dart';
import '../../../feature/owner/repository/owner_respository.dart';
import '../../../network_exceptions.dart';

part 'active_subscription_state.dart';
part 'active_subscription_cubit.freezed.dart';
@injectable
class ActiveSubscriptionCubit extends Cubit<ActiveSubscriptionState> {
final OwnerBaseRepository _ownerBaseRepository;
  ActiveSubscriptionCubit(this._ownerBaseRepository) : super(const ActiveSubscriptionState.initial());
  Future<void> emitActiveSubscription()async{
    emit(const ActiveSubscriptionState.loading());
    final response = await _ownerBaseRepository.activeSubscription();
    response.fold((l) => emit(ActiveSubscriptionState.error(l)), (r) => emit(ActiveSubscriptionState.success(r)));
  }}
