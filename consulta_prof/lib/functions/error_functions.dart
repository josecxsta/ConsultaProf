import 'dart:async';
import 'dart:io';

import 'package:catcher/catcher_plugin.dart';
import 'package:consulta_prof/exceptions/api_exception.dart';
import 'package:consulta_prof/models/session_model.dart';
import 'package:consulta_prof/services/api_url_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

var localization = LocalizationOptions.buildDefaultPortugueseOptions();

Map<String, dynamic> customParameters = Map();

CatcherOptions debugOptions = CatcherOptions(
  SilentReportMode(),
  [
    ConsoleHandler(
      enableApplicationParameters: true,
      enableCustomParameters: true,
      enableStackTrace: true,
      enableDeviceParameters: true,
    ),
    ToastHandler(
      gravity: ToastHandlerGravity.top,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    ),
    HttpHandler(
      HttpRequestType.post,
      Uri.parse(ApiUrlService().urlReportLog()),
      printLogs: true,
    ),
  ],
  localizationOptions: [localization],
  customParameters: customParameters,
);

CatcherOptions releaseOptions = CatcherOptions(
  SilentReportMode(),
  [
    ConsoleHandler(),
    ToastHandler(
      backgroundColor: Colors.red,
      textColor: Colors.white,
      customMessage:
          'Ocorreu um erro, estaremos corrigindo o mais breve possível.',
    ),
    HttpHandler(
      HttpRequestType.post,
      Uri.parse(ApiUrlService().urlReportLog()),
      printLogs: true,
    ),
  ],
  localizationOptions: [localization],
  customParameters: customParameters,
);

void runMyApp(Widget widget) {
  Catcher(
    widget,
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
  );
}

Future reportError(dynamic error, dynamic stackTrace) async {
  if (ehErroDeTimeoutNaConexao(error)) {
    error = Exception(
        'Não foi possível conectar ao servidor. Verifique sua conexão.');
  }
  if (ehErroOcorridoNoServidor(error)) {
    error = Exception(
        'Ops! Ocorreu um erro em nosso servidor. Iremos verificar o mais breve possível. Por favor, tente novamente mais tarde.');
  }
  if (ehErroDeAberturaDeArquivo(error)) {
    error = Exception(
        'Ocorreu um erro ao tentar abrir algum arquivo.\n' + error.toString());
  }
  Catcher.reportCheckedError(error, stackTrace);
}

void configureCustomParametersCatcher(SessionModel session) {
  customParameters['id_usuario'] = session.user.id;
  customParameters['nom_usuario'] = session.user.nome;
  customParameters['token_usuario'] = session.tokenUsuario;
}

void trateApiException(Map data) {
  if (data == null) {
    return;
  }
  if ((data['Msg'].toString().isNotEmpty)) {
    throw ApiException(
      code: data['Erro'],
      message: data['Msg'],
    );
  }
}

bool ehErroDeTimeoutNaConexao(dynamic error) {
  return (error is DioError) &&
      (error.type == DioErrorType.CONNECT_TIMEOUT ||
          error.type == DioErrorType.RECEIVE_TIMEOUT ||
          error.type == DioErrorType.SEND_TIMEOUT ||
          (error.type == DioErrorType.DEFAULT && error.error is SocketException));
}

bool ehErroOcorridoNoServidor(dynamic error) {
  return (error is DioError) &&
      ((error.type == DioErrorType.RESPONSE &&
              error.response.statusCode == 500) ||
          (error.type == DioErrorType.DEFAULT && error.response == null));
}

bool ehErroDeAberturaDeArquivo(dynamic error) {
  return (error is OSError) && (error.errorCode == 2);
}
