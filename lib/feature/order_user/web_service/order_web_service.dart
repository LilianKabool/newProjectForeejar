
import 'package:injectable/injectable.dart';

import '../../../core/api/api_consumer.dart';
import '../../../core/constant/end_points.dart';
import '../../../core/params/rate_product_params.dart';
import '../../../core/params/store_order_params.dart';
import '../entity/base_order_entity.dart';
import '../entity/store_order_entity.dart';

abstract class OrderBaseWebServices{
  Future<BaseOrderEntity> rateProduct(RateProductParams rateProductParams);
  Future<StoreOrderEntity> storeOrder(StoreOrderParams storeOrderParams);

}
@Singleton(as: OrderBaseWebServices)
class OrderWebServicesImpl implements OrderBaseWebServices{
  final ApiConsumer _apiConsumer;

  OrderWebServicesImpl({required ApiConsumer apiConsumer}) : _apiConsumer = apiConsumer;

  @override
  Future<BaseOrderEntity> rateProduct(RateProductParams rateProductParams) async{
    final response = await _apiConsumer.post(EndPoints.rateProduct,queryParameters: rateProductParams.toJson());
    return BaseOrderEntity.fromJson(response);

  }

  @override
  Future<StoreOrderEntity> storeOrder(StoreOrderParams storeOrderParams)async {
    final response = await _apiConsumer.post(EndPoints.storeOrder,queryParameters: storeOrderParams.toJson());
    return StoreOrderEntity.fromJson(response);
  }

}