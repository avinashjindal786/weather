
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


@singleton
class NeededVariables {
  bool _loaded = false;

  String? get deviceToken => _deviceToken;

  String? get deviceType => _deviceType;

  String? get deviceVersion => _deviceVersion;

  SharedPreferences get sharedPreferences => _sharedPreferences;

  Dio get dio => _dio;
  String? _deviceToken;
  String? _deviceType;
  String? _deviceVersion;
  late SharedPreferences _sharedPreferences;
  final Dio _dio = Dio();

  Future<void> load(
      {required String? token,
      required String type,
      required String version}) async {
    _deviceToken = token;
    _deviceType = type;
    _deviceVersion = version;
    // _cacheStore = DbCacheStore();
    _sharedPreferences = await SharedPreferences.getInstance();
    _loaded = true;
  }

  bool get isLoaded => _loaded;
}
