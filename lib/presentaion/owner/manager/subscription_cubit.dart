import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/params/get_subscription_params.dart';
import '../../../feature/owner/entity/subscriptions_entity.dart';
import '../../../feature/owner/repository/owner_respository.dart';
import '../../../network_exceptions.dart';

part 'subscription_state.dart';
part 'subscription_cubit.freezed.dart';


@injectable
class SubscriptionCubit extends Cubit<SubscriptionState> {
  final OwnerBaseRepository _ownerBaseRepository;
  Map<int, bool> selectedSubscriptions = {};

  SubscriptionCubit(this._ownerBaseRepository) : super(const SubscriptionState.initial());

  Future<void> emitGetSubscription({required GetSubscriptionParams getSubscriptionParams}) async {
    emit(const SubscriptionState.loading());
    final response = await _ownerBaseRepository.subscriptions(getSubscriptionParams);
    response.fold(
            (l) => emit(SubscriptionState.error(l)),
            (r) {
          selectedSubscriptions = {for (var sub in r.subscriptions) sub.id: false};
          emit(SubscriptionState.success(subscriptions: r,selectedSubscriptions:  Map.of(selectedSubscriptions)));
        }
    );
  }

  void toggleSubscription(int id) {
    if (selectedSubscriptions.containsKey(id)) {
      selectedSubscriptions[id] = !selectedSubscriptions[id]!;
      print("Toggled Subscription $id: ${selectedSubscriptions[id]}");
      if (state is SuccessSubscription) {
        SuccessSubscription currentState = state as SuccessSubscription;
        emit(SubscriptionState.success( subscriptions:  currentState.subscriptions,selectedSubscriptions:  Map.of(selectedSubscriptions)));
      }
    }
  }
}
