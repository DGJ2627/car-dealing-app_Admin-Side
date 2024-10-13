import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:car_dekho_app/src/utils/logger.dart';
import 'package:dio/dio.dart';

class DioInterceptors extends Interceptor {
  Dio dio = Dio();

  DioInterceptors() {
    _initializeDio();
  }

  void _initializeDio() async {
    String? token = await AppConstants.getCurrentAdminToken();
    Log.debug("API TOKEN == $token");
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          Log.debug('Request[${options.method}] => PATH: ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          Log.debug(
              'Response[${response.statusCode}] => DATA: ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) {
          Log.error(
              'Error[${error.response?.statusCode}] => MESSAGE: ${error.message}');
          return handler.next(error);
        },
      ),
    );
  }

  Dio get instance => dio;

  Future<Response> post(
      {required String endPoint, required Map<String, dynamic> data}) async {
    try {
      return await dio.post(endPoint, data: data);
    } on DioException catch (e) {
      Log.debug(e);
      throw Exception("Failed to call API :- $e");
    }
  }

  Future<Response> get({required String endPoint}) async {
    String? adminToken = await AppConstants.getCurrentAdminToken();
    try {
      return await dio.get(
        endPoint,
        options: Options(headers: {
          'Authorization': 'Bearer $adminToken',
        }),
      );
    } on DioException catch (e) {
      Log.debug(e);
      throw Exception("Failed to call API :- $e");
    }
  }
}
