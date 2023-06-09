import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hrd/src/base/base.dart';
import 'package:hrd/src/base/client/local_storage/base_local_storage_client.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/common/constant/share_pref_key.dart';

class DioClient extends BaseApiClient with LogMixin {
  static const int _defaultMsTimeout = 20000;
  final BaseLocalStorageClient localStorageClient;

  final Dio _dio = Dio();

  DioClient({int? msTimeout, required this.localStorageClient}) {
    _dio.options.connectTimeout = msTimeout ?? _defaultMsTimeout;
    _dio.options.sendTimeout = msTimeout ?? _defaultMsTimeout;
    _dio.options.receiveTimeout = msTimeout ?? _defaultMsTimeout;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, requestInterceptorHandler) {
          logI(
              "${DateTime.now()} ${requestOptions.headers} \n ${requestOptions.method} : ${requestOptions.baseUrl + requestOptions.path} \n ${requestOptions.queryParameters}");
          requestInterceptorHandler.next(requestOptions);
        },
        onResponse: (response, responseInterceptorHandler) {
          logI("${DateTime.now()} ${response.statusCode} : ${response.data}");
          responseInterceptorHandler.next(response);
        },
        onError: (dioError, errorInterceptorHandler) {
          errorInterceptor(dioError, errorInterceptorHandler);
        },
      ),
    );
  }

  errorInterceptor(DioError dioError,
      ErrorInterceptorHandler errorInterceptorHandler) async {
    logE("${DateTime.now()} ${dioError.type} : ${dioError.error}");

    try {
      final token = await localStorageClient.getByKey(
        SharedPrefKey.token,
        SharedPrefType.string,
      );

      if (token != null && dioError.response?.statusCode == 401) {
        logD("TODO: REFRESH TOKEN");

        //TODO: REFRESH TOKEN
        // var rawUser = await localStorageClient.getByKey(
        //   SharedPrefKey.user,
        //   SharedPrefType.string,
        // );
        //
        // if (rawUser != null) {
        //   var user = User.fromJson(jsonDecode(rawUser));
        //   Response response = await post(
        //     Url.baseUrl + Url.login,
        //     queryParams: {
        //       'email': user.email,
        //       'password': user.pas,
        //     },
        //   );
        //
        //   var accessToken = response.data['data']['access-token'];
        //   await localStorageClient.saveByKey(
        //     accessToken,
        //     SharedPrefKey.token,
        //     SharedPrefType.string,
        //   );
        // }
      }
    } catch (e) {
      debugPrint("ERROR REFRESH TOKEN: $e");
    }

    errorInterceptorHandler.next(dioError);
  }

  Future<String?> getToken() async => await localStorageClient.getByKey(
      SharedPrefKey.token, SharedPrefType.string) as String?;

  @override
  Future<Response> get(
    String url, {
    String? token,
    responseType = ResponseType.json,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    int msTimeout = 10000,
  }) async {
    Map<String, dynamic> headers0 = <String, dynamic>{
      "Accept": "application/json",
    };

    if (headers != null) {
      headers.forEach((k, v) => headers0[k] = v);
    }

    token = await getToken();

    if (token != null) headers0['Authorization'] = 'Bearer $token';

    _dio.options.connectTimeout = msTimeout;
    _dio.options.receiveTimeout = msTimeout;

    try {
      final response = await _dio.get(
        url,
        options: Options(headers: headers0, responseType: responseType),
        queryParameters: queryParams,
      );

      return _returnResponse(response);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw TimeoutException(e.error);
      } else if (e.type == DioErrorType.other) {
        throw FetchDataException(e.error);
      } else if (e.type == DioErrorType.response) {
        return _returnResponse(e.response);
      } else {
        throw FetchDataException(e.error);
      }
    }
  }

  @override
  Future<Response> patch(
    String url, {
    String? token,
    dynamic data,
    Map? headers,
    Map<String, dynamic>? queryParams,
    String contentType = 'application/json',
    int msTimeout = 10000,
  }) async {
    Map<String, dynamic> headers0 = <String, dynamic>{};

    if (headers != null) {
      headers.forEach((k, v) => headers0[k] = v);
    }

    if (token != null) headers0['Authorization'] = 'Bearer $token';

    headers0['Content-Type'] = contentType;

    _dio.options.connectTimeout = msTimeout;
    _dio.options.receiveTimeout = msTimeout;

    try {
      final response = await _dio.patch(
        url,
        data: data,
        options: Options(headers: headers0),
        queryParameters: queryParams,
      );

      return _returnResponse(response);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw TimeoutException(e.error);
      } else if (e.type == DioErrorType.other) {
        throw FetchDataException(e.error);
      } else if (e.type == DioErrorType.response) {
        return _returnResponse(e.response);
      } else {
        throw FetchDataException(e.error);
      }
    }
  }

  @override
  Future<Response> post(
    String url, {
    dynamic data,
    String? token,
    Map? headers,
    Map<String, dynamic>? queryParams,
    String contentType = 'application/json',
    int msTimeout = 10000,
  }) async {
    Map<String, dynamic> headers0 = <String, dynamic>{};

    headers0["Accept"] = "application/json";

    if (headers != null) {
      headers.forEach((k, v) => headers0[k] = v);
    }

    token = await getToken();

    if (token != null) headers0['Authorization'] = 'Bearer $token';

    headers0['Content-Type'] = contentType;

    _dio.options.connectTimeout = msTimeout;
    _dio.options.receiveTimeout = msTimeout;

    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(headers: headers0),
        queryParameters: queryParams,
      );

      return _returnResponse(response);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw TimeoutException(e.error);
      } else if (e.type == DioErrorType.other) {
        throw FetchDataException(e.response?.data);
      } else if (e.type == DioErrorType.response) {
        return _returnResponse(e.response);
      } else {
        throw FetchDataException(e.response?.data);
      }
    }
  }

  @override
  Future<Response> delete(
    String url, {
    dynamic data,
    String? token,
    Map? headers,
    Map<String, dynamic>? queryParams,
    String contentType = 'application/json',
    int msTimeout = 10000,
  }) async {
    Map<String, dynamic> headers0 = <String, dynamic>{};

    if (headers != null) {
      headers.forEach((k, v) => headers0[k] = v);
    }

    if (token != null) headers0['Authorization'] = 'Bearer $token';

    headers0['Content-Type'] = contentType;

    _dio.options.connectTimeout = msTimeout;
    _dio.options.receiveTimeout = msTimeout;

    try {
      final response = await _dio.delete(
        url,
        data: data,
        options: Options(headers: headers0),
        queryParameters: queryParams,
      );

      return _returnResponse(response);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw TimeoutException(e.error);
      } else if (e.type == DioErrorType.other) {
        throw FetchDataException(e.error);
      } else if (e.type == DioErrorType.response) {
        return _returnResponse(e.response);
      } else {
        throw FetchDataException(e.error);
      }
    }
  }

  @override
  Future<Response> put(
    String url, {
    dynamic data,
    String? token,
    Map? headers,
    Map<String, dynamic>? queryParams,
    String contentType = 'application/json',
    int msTimeout = 10000,
  }) async {
    Map<String, dynamic> headers0 = <String, dynamic>{};

    if (headers != null) {
      headers.forEach((k, v) => headers0[k] = v);
    }

    if (token != null) headers0['Authorization'] = 'Bearer $token';

    headers0['Content-Type'] = contentType;

    _dio.options.connectTimeout = msTimeout;
    _dio.options.receiveTimeout = msTimeout;

    try {
      final response = await _dio.put(
        url,
        data: data,
        options: Options(headers: headers0),
        queryParameters: queryParams,
      );

      return _returnResponse(response);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw TimeoutException(e.error);
      } else if (e.type == DioErrorType.other) {
        throw FetchDataException(e.error);
      } else if (e.type == DioErrorType.response) {
        return _returnResponse(e.response);
      } else {
        throw FetchDataException(e.error);
      }
    }
  }
}

_returnResponse(Response? responseDio) {
  dynamic response = responseDio;
  try {
    if (responseDio!.statusCode! >= 300) {
      response =
          BaseResponse.fromJson(responseDio.data, (json) => null).meta.message;
    }
  } catch (e) {
    debugPrint("UNRECOGNIZED SERVER MESSAGE $e");
    response = responseDio;
  }

  if (response == null) throw FetchDataException(response);

  switch (responseDio?.statusCode) {
    case 200:
      return response;
    case 201:
      return response;
    case 204:
      throw NotFoundException(response);
    case 400:
      throw BadRequestException(response);
    case 401:
      throw UnauthorizedException(response);
    case 403:
      throw ForbiddenException(response);
    case 404:
      throw NotFoundException(response);
    case 422:
      throw BadAuthException(response);
    case 500:
      throw InternalServerErrorException(response);
    case 503:
      throw ServiceUnavailableException(response);
    case 504:
      throw TimeoutException(response);
    default:
      throw FetchDataException(response);
  }
}
