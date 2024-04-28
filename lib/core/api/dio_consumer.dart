


import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../injection_container.dart';
import '../constant/end_points.dart';
import '../constant/strings_constants.dart';
import 'api_consumer.dart';
import 'logging_interceptor.dart';

@singleton
class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode;
    final isValid = status != null && status >= 200 && status < 300;
    if (!isValid) {
      throw DioException.badResponse(
        statusCode: status!,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
    super.onResponse(response, handler);
  }
}

@Singleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  DioConsumer(
    this._client,
  ) {
    _client.options
      ..sendTimeout = const Duration(seconds: 10)
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 60)
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = true;
    if (kDebugMode) {
      _client.interceptors
          .addAll([getItMhamad<LoggingInterceptor>(), getItMhamad<ErrorInterceptor>()]);
    }
  }
  final Dio _client;
  late Map<String, String> _headers;

 void setHeaders() async {
    _headers = {
      StringsConstants.accept: StringsConstants.applicationJson,
      StringsConstants.contentType: StringsConstants.applicationJson,
    //   StringsConstants.authToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbW9iaWxlL2xvZ2luIiwiaWF0IjoxNzEwNTI4MjE0LCJleHAiOjIwMjU4ODgyMTQsIm5iZiI6MTcxMDUyODIxNCwianRpIjoiN3B0M3BxUjlpUUFVMnlXayIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.bM4rZWG6tJ3Ig0VCw_fH1Mrb-OzNPNV2sVzn0e2X1vw",
     StringsConstants.lang:"ar",
    };
  }
  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    setHeaders();

    try {
      final Response response = await _client.get(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: Options(
          headers: _headers,
          validateStatus: (int? status) {
            return status != null;
          },
        ),
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      print("ssssssssssssssssssssssssssssssssssssssssss$error");
      rethrow;
    }
  }

  @override
  Future post(
    String path, {
    dynamic body,
    String? token,
    FormData? formData,
    ResponseType? responseType,
    Map<String, dynamic>? queryParameters,
  }) async {
    setHeaders();

    try {
      final Response response = await _client.post(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: _headers,
          validateStatus: (int? status) {
            return status != null;
          },
          contentType:
              formData == null ? StringsConstants.jsonContentType : null,
          responseType: responseType,
        ),
        data: formData ?? body,
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    setHeaders();
    try {
      final Response response = await _client.put(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: _headers,
          contentType: StringsConstants.jsonContentType,
        ),
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  dynamic _handleResponseAsJson(Response response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  @override
  Future delete(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    setHeaders();

    try {
      final Response response = await _client.delete(
        path,
        data: body,
        options: Options(
          headers: _headers,
          contentType: StringsConstants.jsonContentType,
        ),
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }
}