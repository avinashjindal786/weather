import 'package:dio/dio.dart';
import 'package:flutter_assignment/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import '../service_locator/service_locator.dart';
import '../services/needed_utils.dart';
import 'Interceptor.dart';

part 'api_service.g.dart';

@lazySingleton
//live api
@RestApi(baseUrl: 'https://api.openweathermap.org/data/3.0/onecall')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @factoryMethod
  static ApiService create() {
    final dio = locator<NeededVariables>().dio;
    dio.options = BaseOptions(receiveTimeout: 20000, connectTimeout: 20000, headers: {"Authorization": "Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg=="});
    dio.interceptors.add(throughOutInterceptorsWrapper(dio));
    return ApiService(dio);
  }

  /////////////////////////
  ///// GET REQs ////////
  ///////////////////////
}
