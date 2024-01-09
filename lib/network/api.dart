import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

String baseUrl = 'https://apiv2.allsportsapi.com/';
String apiKey =
    'ea86e87ffd29e5d2b180c85640db6c2f880d75fd66ad86f2dbcc8519d52e7605';

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
