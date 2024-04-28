part of 'processing_orders_cubit.dart';

@freezed
class ProcessingOrdersState with _$ProcessingOrdersState {
    const factory ProcessingOrdersState.loading() = Loading;

  const factory ProcessingOrdersState.success(ProcessingOrdersEntity processingOrdersEntity) = Success;

  const factory ProcessingOrdersState.error(NetworkExceptions networkExceptions) =
      Error;}
