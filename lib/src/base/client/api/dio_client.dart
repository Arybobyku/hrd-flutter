import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hrd/src/base/client/local_storage/base_local_storage_client.dart';
import 'package:hrd/src/common/common.dart';
import 'package:hrd/src/common/constant/share_pref_key.dart';

import '../../common/exception.dart';
import 'base_api_client.dart';

class DioClient extends BaseApiClient with LogMixin {
  static const int _defaultMsTimeout = 20000;
  final BaseLocalStorageClient localStorageClient;

  DioClient({int? msTimeout,required this.localStorageClient}) {
    _dio.options.connectTimeout = msTimeout ?? _defaultMsTimeout;
    _dio.options.sendTimeout = msTimeout ?? _defaultMsTimeout;
    _dio.options.receiveTimeout = msTimeout ?? _defaultMsTimeout;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, requestInterceptorHandler) {
          logI("${DateTime.now()} ${requestOptions.method} : ${requestOptions.baseUrl+requestOptions.path} \n ${requestOptions.queryParameters}");
        },
        onResponse: (response, responseInterceptorHandler) {
          logI("${DateTime.now()} ${response.statusCode} : ${response.data}");
        },
        onError:(dioError,errorInterceptorHandler) => errorInterceptor(dioError,errorInterceptorHandler),
      ),
    );
  }

  final Dio _dio = Dio();

  dynamic errorInterceptor(DioError dioError,ErrorInterceptorHandler errorInterceptorHandler) async{
    final token = await localStorageClient.getByKey(SharedPrefKey.token, SharedPrefType.STRING);

    if(token!=null && dioError.response?.statusCode == 401){
      logD("REFRESH TOKEN");

    }

    return dioError;
  }

  @override
  Future<Response> get(
    String url, {
    String? token,
    responseType = ResponseType.json,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    int msTimeout = 10000,
  }) async {
    Map<String, dynamic> _headers = Map<String, dynamic>();

    if (headers != null) {
      headers.forEach((k, v) => _headers[k] = v);
    }

    if (token != null) _headers['Authorization'] = 'Bearer $token';

    _dio.options.connectTimeout = msTimeout;
    _dio.options.receiveTimeout = msTimeout;

    try {
      final response = await _dio.get(
        url,
        options: Options(headers: _headers, responseType: responseType),
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
    Map<String, dynamic> _headers = Map<String, dynamic>();

    if (headers != null) {
      headers.forEach((k, v) => _headers[k] = v);
    }

    if (token != null) _headers['Authorization'] = 'Bearer $token';

    _headers['Content-Type'] = contentType;

    _dio.options.connectTimeout = msTimeout;
    _dio.options.receiveTimeout = msTimeout;

    try {
      final _response = await _dio.patch(
        url,
        data: data,
        options: Options(headers: _headers),
        queryParameters: queryParams,
      );

      return _returnResponse(_response);
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
    Map<String, dynamic> _headers = Map<String, dynamic>();

    if (headers != null) {
      headers.forEach((k, v) => _headers[k] = v);
    }

    if (token != null) _headers['Authorization'] = 'Bearer $token';

    _headers['Content-Type'] = contentType;

    _dio.options.connectTimeout = msTimeout;
    _dio.options.receiveTimeout = msTimeout;

    try {
      final _response = await _dio.post(
        url,
        data: data,
        options: Options(headers: _headers),
        queryParameters: queryParams,
      );

      return _returnResponse(_response);
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
    Map<String, dynamic> _headers = Map<String, dynamic>();

    if (headers != null) {
      headers.forEach((k, v) => _headers[k] = v);
    }

    if (token != null) _headers['Authorization'] = 'Bearer $token';

    _headers['Content-Type'] = contentType;

    _dio.options.connectTimeout = msTimeout;
    _dio.options.receiveTimeout = msTimeout;

    try {
      final _response = await _dio.delete(
        url,
        data: data,
        options: Options(headers: _headers),
        queryParameters: queryParams,
      );

      return _returnResponse(_response);
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
    Map<String, dynamic> _headers = Map<String, dynamic>();

    if (headers != null) {
      headers.forEach((k, v) => _headers[k] = v);
    }

    if (token != null) _headers['Authorization'] = 'Bearer $token';

    _headers['Content-Type'] = contentType;

    _dio.options.connectTimeout = msTimeout;
    _dio.options.receiveTimeout = msTimeout;

    try {
      final _response = await _dio.put(
        url,
        data: data,
        options: Options(headers: _headers),
        queryParameters: queryParams,
      );

      return _returnResponse(_response);
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

_returnResponse(Response? response) {
  if (response == null) throw FetchDataException(response);

  switch (response.statusCode) {
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
