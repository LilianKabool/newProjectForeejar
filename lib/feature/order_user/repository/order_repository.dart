import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../core/network/network_info.dart';
import '../../../core/params/rate_product_params.dart';
import '../../../core/params/store_order_params.dart';
import '../../../network_exceptions.dart';
import '../entity/base_order_entity.dart';
import '../entity/store_order_entity.dart';
import '../web_service/order_web_service.dart';

abstract class OrderBaseRepository{
  Future<Either<NetworkExceptions,BaseOrderEntity>> rateProduct(RateProductParams rateProductParams);
  Future<Either<NetworkExceptions,StoreOrderEntity>> storeOrder(StoreOrderParams storeOrderParams);

}
@Singleton(as: OrderBaseRepository)
class OrderRepositoryImpl implements OrderBaseRepository{
  final NetworkInfo _networkInfo;
  final OrderBaseWebServices _orderBaseWebServices;

  OrderRepositoryImpl({required NetworkInfo networkInfo, required OrderBaseWebServices orderBaseWebServices}) : _networkInfo = networkInfo, _orderBaseWebServices = orderBaseWebServices;
  @override
  Future<Either<NetworkExceptions, BaseOrderEntity>> rateProduct(RateProductParams rateProductParams) async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _orderBaseWebServices.rateProduct(rateProductParams);
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, StoreOrderEntity>> storeOrder(StoreOrderParams storeOrderParams) async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _orderBaseWebServices.storeOrder(storeOrderParams);
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }
}