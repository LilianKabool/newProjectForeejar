import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import '../../../core/api/api_consumer.dart';
import '../../../core/constant/end_points.dart';
import '../../../core/params/add_photo_to_product_params.dart';
import '../../../core/params/get_category_attribute_params.dart';
import '../../../core/params/get_subscription_params.dart';
import '../../../core/params/set_card_info_params.dart';
import '../../../core/params/subscripe_params.dart';
import '../../../core/params/update_product_params.dart';
import '../entity/active_subscruption_entity.dart';
import '../entity/base_entity.dart';
import '../entity/get_category_attribute_entity.dart';
import '../entity/my_products_entity.dart';
import '../entity/my_subscription_entity.dart';
import '../entity/processing_orders_entity.dart';
import '../entity/subscriptions_entity.dart';

abstract class OwnerBaseWebServices{
  Future<BaseSubscriptionsEntity> subscription(GetSubscriptionParams getSubscriptionParams);
  Future<MySubscriptionEntity> mySubscription();
  Future<BaseMyProductEntity> myProducts();
  Future<ProcessingOrdersEntity> processingOrders();
  Future<BaseEntity> setCardInfo(SetCardInfoParams setCardInfoParams);
  Future<BaseEntity> subscripe(SubscripeParams subscripeParams);
  Future<BaseActiveSubscriptionEntity> activeSubscription();
  Future<GetCategoryAttributesEntity> getCategoryAttributes(GetCategoryAttributeParams getCategoryAttributeParams);
  Future<BaseEntity> addPhotoToProduct(AddPhotoToProductParams addPhotoToProductParams);
  Future<BaseEntity> updateProduct(UpdateProductParams updateProductParams);


}
@Singleton(as: OwnerBaseWebServices)
class OwnerWebServicesImpl implements OwnerBaseWebServices{
  final ApiConsumer _apiConsumer;

  OwnerWebServicesImpl({required ApiConsumer apiConsumer}) : _apiConsumer = apiConsumer;

  @override
  Future<BaseSubscriptionsEntity> subscription(GetSubscriptionParams getSubscriptionParams) async{
    final response = await _apiConsumer.get(EndPoints.subscription,queryParameters: getSubscriptionParams.toJson());
    return BaseSubscriptionsEntity.fromJson(response);
  }

  @override
  Future<MySubscriptionEntity> mySubscription() async{
    final response = await _apiConsumer.post(EndPoints.mySubscription,);
    return MySubscriptionEntity.fromJson(response);
  }

  @override
  Future<BaseMyProductEntity> myProducts() async{
    final response = await _apiConsumer.get(EndPoints.myProducts,);
    return BaseMyProductEntity.fromJson(response);
  }

  @override
  Future<ProcessingOrdersEntity> processingOrders() async{
    final response = await _apiConsumer.get(EndPoints.processingOrders,);
    return ProcessingOrdersEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> setCardInfo(SetCardInfoParams setCardInfoParams) async{
    final response = await _apiConsumer.post(EndPoints.setCardInfo,queryParameters: setCardInfoParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> subscripe(SubscripeParams subscripeParams) async{
    final response = await _apiConsumer.post(EndPoints.subscripe,queryParameters: subscripeParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseActiveSubscriptionEntity> activeSubscription() async{
    final response = await _apiConsumer.post(EndPoints.activeSubscription);
    return BaseActiveSubscriptionEntity.fromJson(response);
  }

  @override
  Future<GetCategoryAttributesEntity> getCategoryAttributes(GetCategoryAttributeParams getCategoryAttributeParams) async{
    final response = await _apiConsumer.post(EndPoints.getCategoryAttributes,queryParameters: getCategoryAttributeParams.toJson());
    return GetCategoryAttributesEntity.fromJson(response);
  }
  Future<FormData> formAddFile(AddPhotoToProductParams addPhotoToProductParams) async {
    final formData = FormData.fromMap({
      'path': await MultipartFile.fromFile(addPhotoToProductParams.photo.path),
    });

    return formData;
  }

  @override
  Future<BaseEntity> addPhotoToProduct(AddPhotoToProductParams addPhotoToProductParams) async{
    final formData = await formAddFile(addPhotoToProductParams);

    final response = await _apiConsumer.post(
      EndPoints.addPhotoToProduct,
      body: formData,
    );

    return BaseEntity.fromJson(response);

  }

  Future<FormData> formUpdateData(UpdateProductParams updateProductParams) async {
    final formData = FormData.fromMap({
      'product_id': updateProductParams.productId,
      'name': updateProductParams.name,
      'name_en': updateProductParams.engilshName,
      'description': updateProductParams.description,
      'description_en': updateProductParams.englishDescription,
      'price': updateProductParams.price,
      'country_id': updateProductParams.countryId,
      'city_id': updateProductParams.cityId,
      'start_date': updateProductParams.startDate,
      // 'attribute_ids': updateProductParams.attributeIds,
      // 'attribute_values': updateProductParams.attributeValues,
      'photo': await MultipartFile.fromFile(updateProductParams.photo.path),
    });

    return formData;
  }

  @override
  Future<BaseEntity> updateProduct(UpdateProductParams updateProductParams) async {
    final formData = await formUpdateData(updateProductParams);

    final response = await _apiConsumer.post(
      EndPoints.updateProduct,
      body: formData,
    );

    return BaseEntity.fromJson(response);
  }


}
