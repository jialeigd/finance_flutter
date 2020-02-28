import 'package:dio/dio.dart';
import 'SHFHttpCode.dart';
import 'SHFHttpHost.dart';
import 'SHFHttpResultData.dart';
import 'SHFHttpDataHelper.dart';
import 'SHFResponseInterceptor.dart';

class SHFHttpManager {
  static SHFHttpManager _instance = SHFHttpManager._internal();
  Dio _dio;

  static const CODE_SUCCESS = 200;
  static const CODE_TIME_OUT = -1;

  factory SHFHttpManager() => _instance;

  ///通用全局单例，第一次使用时初始化
  SHFHttpManager._internal({String baseUrl}) {
    if (null == _dio) {
      _dio = new Dio(new BaseOptions(
          baseUrl: SHFHttpHost.BASE_URL, connectTimeout: 15000));
      _dio.interceptors.add(new ResponseInterceptors());
    }
  }

  static SHFHttpManager getInstance({String baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  //用于指定特定域名，比如cdn和kline首次的http请求
  SHFHttpManager _baseUrl(String baseUrl) {
    if (_dio != null) {
      _dio.options.baseUrl = baseUrl;
    }
    return this;
  }

  //一般请求，默认域名
  SHFHttpManager _normal() {
    if (_dio != null) {
      if (_dio.options.baseUrl != SHFHttpHost.BASE_URL) {
        _dio.options.baseUrl = SHFHttpHost.BASE_URL;
      }
    }
    return this;
  }

  ///通用的GET请求
  Future<dynamic> get(api, params, {noTip = false}) async {
    Response response;
    try {
      response = await _dio.get(api, queryParameters: params);
    } on DioError catch (e) {
      return resultError(e);
    }

    if (response.data is DioError) {
      return resultError(response.data['code']);
    }

    return response.data;
  }

  ///通用的POST请求
  post(api, params, {noTip = false}) async {
    Response response;

    try {
      response = await _dio.post(api, data: params);
    } on DioError catch (e) {
      return resultError(e);
    }

    if (response.data is DioError) {
      return resultError(response.data['code']);
    }

    return response.data;
  }
}

SHFHttpResultData resultError(DioError e) {
  Response errorResponse;
  if (e.response != null) {
    errorResponse = e.response;
  } else {
    errorResponse = new Response(statusCode: 666);
  }
  if (e.type == DioErrorType.CONNECT_TIMEOUT ||
      e.type == DioErrorType.RECEIVE_TIMEOUT) {
    errorResponse.statusCode = SHFHttpCode.SHF_NETWORK_TIMEOUT;
  }
  return new SHFHttpResultData(
      errorResponse.statusMessage, false, errorResponse.statusCode);
}