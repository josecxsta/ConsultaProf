import 'dart:async';

import 'package:consulta_prof/services/api_response.dart';
import 'package:dio/dio.dart';

class ApiService {
  Future<dynamic> get(
    url, {
    Map<String, String> headers,
    Map<String, String> params,
  }) async {
    return Dio(_crieOpcoes(headers))
        .get(url)
        .then((response) {
      if (response.statusCode != 200) _handleResponseError(url, response);
      return response.data;
    });
  }


  Future<ApiResponse> post(
    url, {
    Map<String, String> headers,
    body,
  }) async {
    return Dio(_crieOpcoes(headers))
        .post(url, data: body)
        .then((response) {
      if (response.statusCode != 200) _handleResponseError(url, response);
      return _convert(response);
    });
  }

  BaseOptions _crieOpcoes(Map<String, String> headers) {
    var options = BaseOptions();
    options.connectTimeout = 5000; //5s
    options.receiveTimeout = 30000; //30s
    if (headers != null) {
      options.headers = headers;
    }
    return options;
  }
}

ApiResponse _convert(Response response) {
  return ApiResponse(
    data: response.data,
    statusCode: response.statusCode,
  );
}

void _handleResponseError(url, Response response) {
  throw Exception(
      "Oops! Ocorreu algum problema com o nosso servidor. Por favor, tente novamente!\nUrl:$url\nMotivo: ${response.statusCode} - ${response.data}");
}
