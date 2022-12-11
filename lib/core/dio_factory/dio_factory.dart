import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";
const String dafaultLanguage = "language";

class DioFactory {
  // final AppPreferences _appPreferences;
  // DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    // String language = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      "content-type": applicationJson,
      accept: applicationJson,
      authorization: "put token here", //TODO get token from prefs
      dafaultLanguage: "en"
    };
    const int timeout = 60000;
    dio.options = BaseOptions(
      baseUrl: "http://numbersapi.com",
      headers: headers,
      receiveTimeout: timeout,
      sendTimeout: timeout,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          error: true));
    }

    return dio;
  }
}
