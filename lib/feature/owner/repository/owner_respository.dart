import 'package:dartz/dartz.dart';


import 'package:injectable/injectable.dart';

import '../../../core/network/network_info.dart';
import '../../../core/params/add_photo_to_product_params.dart';
import '../../../core/params/get_category_attribute_params.dart';
import '../../../core/params/get_subscription_params.dart';
import '../../../core/params/set_card_info_params.dart';
import '../../../core/params/subscripe_params.dart';
import '../../../core/params/update_product_params.dart';
import '../../../network_exceptions.dart';
import '../entity/active_subscruption_entity.dart';
import '../entity/base_entity.dart';
import '../entity/get_category_attribute_entity.dart';
import '../entity/my_products_entity.dart';
import '../entity/my_subscription_entity.dart';
import '../entity/processing_orders_entity.dart';
import '../entity/subscriptions_entity.dart';
import '../web_services/owner_web_services.dart';

abstract class OwnerBaseRepository{
  Future<Either<NetworkExceptions, BaseSubscriptionsEntity>> subscriptions(GetSubscriptionParams getSubscriptionParams);
  Future<Either<NetworkExceptions, MySubscriptionEntity>> mySubscriptions();
  Future<Either<NetworkExceptions, BaseMyProductEntity>> myProducts();
  Future<Either<NetworkExceptions, ProcessingOrdersEntity>> processingOrders();
  Future<Either<NetworkExceptions, BaseEntity>> setCardInfo(SetCardInfoParams setCardInfoParams);
  Future<Either<NetworkExceptions, BaseEntity>> subscripe(SubscripeParams subscripeParams);
  Future<Either<NetworkExceptions, BaseActiveSubscriptionEntity>> activeSubscription();
  Future<Either<NetworkExceptions, GetCategoryAttributesEntity>> getCategoryAttribute(GetCategoryAttributeParams getCategoryAttributeParams);
  Future<Either<NetworkExceptions, BaseEntity>> addPhotoToProduct(AddPhotoToProductParams addPhotoToProductParams);
  Future<Either<NetworkExceptions, BaseEntity>> updateProduct(UpdateProductParams updateProductParams);
}
@Singleton(as: OwnerBaseRepository)
class OwnerRepositoryImpl implements OwnerBaseRepository{
  final OwnerBaseWebServices _ownerBaseWebServices;
  final NetworkInfo _networkInfo;

  OwnerRepositoryImpl({required OwnerBaseWebServices ownerBaseWebServices, required NetworkInfo networkInfo}) : _ownerBaseWebServices = ownerBaseWebServices, _networkInfo = networkInfo;
  @override
  Future<Either<NetworkExceptions, BaseSubscriptionsEntity>> subscriptions(GetSubscriptionParams getSubscriptionParams) async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _ownerBaseWebServices.subscription(getSubscriptionParams);
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, MySubscriptionEntity>> mySubscriptions() async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _ownerBaseWebServices.mySubscription();
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseMyProductEntity>> myProducts()async {
    try{
      if(await _networkInfo.isConnected){
        final response = await _ownerBaseWebServices.myProducts();
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, ProcessingOrdersEntity>> processingOrders() async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _ownerBaseWebServices.processingOrders();
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> setCardInfo(SetCardInfoParams setCardInfoParams) async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _ownerBaseWebServices.setCardInfo(setCardInfoParams);
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> subscripe(SubscripeParams subscripeParams) async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _ownerBaseWebServices.subscripe(subscripeParams);
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseActiveSubscriptionEntity>> activeSubscription() async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _ownerBaseWebServices.activeSubscription();
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, GetCategoryAttributesEntity>> getCategoryAttribute(GetCategoryAttributeParams getCategoryAttributeParams) async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _ownerBaseWebServices.getCategoryAttributes(getCategoryAttributeParams);
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> addPhotoToProduct(AddPhotoToProductParams addPhotoToProductParams)async {
    try{
      if(await _networkInfo.isConnected){
        final response = await _ownerBaseWebServices.addPhotoToProduct(addPhotoToProductParams);
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> updateProduct(UpdateProductParams updateProductParams) async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _ownerBaseWebServices.updateProduct(updateProductParams);
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }
}