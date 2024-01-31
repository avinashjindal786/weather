import 'dart:convert';


import 'package:dio/dio.dart';
import '../service_locator/service_locator.dart';
import '../services/needed_utils.dart';
import '../services/connectivity_service.dart';

InterceptorsWrapper throughOutInterceptorsWrapper(Dio dio) {
  final sharedPrefs = locator<NeededVariables>().sharedPreferences;
  var hasConnection = true;
  return InterceptorsWrapper(
    onRequest: (options, handler) async {
      hasConnection = await locator<ConnectivityService>().checkConnectivity();
      if (!hasConnection) {
        handler.reject(DioError(response: Response(data: {'errors': 'No internet Connection'}, requestOptions: options), error: 'No Internet Connection, Try again Later!', requestOptions: options, type: DioErrorType.cancel));
        return;
      }
      options.followRedirects = false;
      options.validateStatus = (status) => status! < 501;

      var variables = locator<NeededVariables>();
      if (variables.isLoaded && !options.headers.containsKey('Authorization')) {
        options.data['device_token'] = variables.deviceToken;
        options.data['device'] = variables.deviceType;
        options.data['device_version'] = variables.deviceVersion;
        options.data['debug'] = 1;
      }
      handler.next(options);
      return;
    },
    onResponse: (response, handler) async {
  
      if (response.statusCode! >= 200 && response.statusCode! < 203) {
          handler.resolve(response);
         
      } else if (response.statusCode! >= 203 && response.statusCode! < 209) {
        response.data = {'data': null};

        handler.resolve(response);
      } else if (response.statusCode! >= 300 && response.statusCode! < 400) {
        handler.reject(DioError(requestOptions: response.requestOptions, response: response, error: 'Need to Login, couldn\'t identify User', type: DioErrorType.cancel));
      } else if (response.statusCode == 400) {
        handler.reject(DioError(requestOptions: response.requestOptions, response: response, error: 'Bad Request Parameters', type: DioErrorType.cancel));
      } else if (response.statusCode == 401) {
        if (response.data['message'] != null) {
          handler.resolve(response);
        }
        handler.reject(DioError(requestOptions: response.requestOptions, response: response, error: 'Need to reLogin', type: DioErrorType.cancel));
      } else if (response.statusCode! > 402 && response.statusCode! < 499) {
        if (response.data['message'] != null) {
          handler.resolve(response);
        }
        handler.reject(DioError(requestOptions: response.requestOptions, response: response, error: 'Error in finding the request', type: DioErrorType.receiveTimeout));
      } else if (response.statusCode! >= 500) {
        handler.reject(DioError(requestOptions: response.requestOptions, response: response, error: 'Internal Server Error', type: DioErrorType.sendTimeout));
      } else {
        handler.reject(DioError(requestOptions: response.requestOptions, response: response, error: 'Can\'t identify Error', type: DioErrorType.sendTimeout));
      }
    },
    onError: (dioError, handler) async {
      handler.next(dioError);
    },
  );
}
