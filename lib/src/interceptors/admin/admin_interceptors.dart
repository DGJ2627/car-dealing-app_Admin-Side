import 'dart:io';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:car_dekho_app/src/utils/logger.dart';
import 'package:dio/dio.dart';
import '../../packages/data/local/shared_preferences/shared_preferences_database.dart';
import '../../packages/helper/status_code_handler.dart';

class DioInterceptors extends Interceptor {
  Dio dio = Dio();

  DioInterceptors() {
    _initializeDio();
  }

  void _initializeDio() async {
    String? token = await LocalString.getCurrentAdminToken();
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
        onRequest: (options, handler) async {
          Log.debug('Request[${options.method}] => PATH: ${options.path}');
          Log.debug('Request[${options.method}] => PATH: ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          Log.debug(
              'Response[${response.statusCode}] => DATA: ${response.data}');
          ApiStatusCode.successFulStatus(response);
          return handler.next(response);
        },
        onError: (error, handler) {
          Log.error(
              'Error[${error.response?.statusCode}] => MESSAGE: ${error.message}');
          ApiStatusCode.errorHandler(error);
          return handler.next(error);
        },
      ),
    );
  }

  Dio get instance => dio;

  Future<Response> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    String? adminToken = await LocalString.getCurrentAdminToken();
    try {
      return await dio.post(
        endPoint,
        data: data,
        options: Options(headers: {
          'Authorization': 'Bearer $adminToken',
        }),
      );
    } on DioException catch (e) {
      Log.debug(e);
      throw Exception("Failed to call API :- $e");
    }
  }

  Future<Response> get(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    String? adminToken = await LocalString.getCurrentAdminToken();
    Log.debug("GET API Token : === $adminToken");
    try {
      return await dio.get(
        endPoint,
        queryParameters: queryParameters,
        options: Options(headers: {
          'Authorization': 'Bearer $adminToken',
        }),
      );
    } on DioException catch (e) {
      Log.debug(e);
      throw Exception("Failed to call API :- $e");
    }
  }

  Future<Response> patch({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    String? adminToken = await LocalString.getCurrentAdminToken();
    try {
      return await dio.patch(
        endPoint,
        options: Options(headers: {
          'Authorization': 'Bearer $adminToken',
        }),
        data: data,
      );
    } on DioException catch (e) {
      Log.debug(e);
      throw Exception("Failed to call API :- $e");
    }
  }

  Future<Response> postWithImage({
    required String endPoint,
    required File imageFile,
    required String imageFieldName,
  }) async {
    String? adminToken = await LocalString.getCurrentAdminToken();
    try {
      FormData formData = FormData();
      formData.files.add(
        MapEntry(
          imageFieldName,
          MultipartFile.fromString(
            imageFile.path,
            filename: imageFile.path.split('/').last,
          ),
        ),
      );

      Log.debug(imageFile.path.split('/').last);
      Log.debug(formData.fields.map((e) => e.key).toString());
      Log.debug(formData.fields.map((e) => e.value).toString());
      Log.debug(formData.files);

      return await dio.post(
        endPoint,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
          headers: {
            'Authorization': 'Bearer $adminToken',
          },
        ),
      );
    } on DioException catch (e) {
      Log.debug(e);
      throw Exception("Failed to call API: $e");
    }
  }

  Future<Response> delete({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    String? adminToken = await LocalString.getCurrentAdminToken();
    try {
      return await dio.delete(
        endPoint,
        options: Options(headers: {
          'Authorization': 'Bearer $adminToken',
        }),
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      Log.debug(e);
      throw Exception("Failed to call API :- $e");
    }
  }
}
