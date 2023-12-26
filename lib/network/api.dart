import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

String baseUrl = 'https://apiv2.allsportsapi.com/';
String apiKey =
    '633b98659e3ed157fca9d28ed2f9cf93374b71f8a0dc06ae1a8545be3374914b';

class API {
  static Dio dio = Dio();
  // Get Token if required
  Options? getToken(bool useToken) {
    if (useToken) {
      debugPrint('ACCESS TOKEN : $apiKey');
      return Options(headers: {
        "Authorization": apiKey,
      });
    }
    return null;
  }

  // Get Request
  Future<Response> get(
    String endPoint, {
    bool useToken = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    debugPrint('API : $baseUrl$endPoint');
    Response response = await dio.get(
      '$baseUrl$endPoint',
      queryParameters: queryParameters,
      options: getToken(useToken),
    );
    return response;
  }
}
