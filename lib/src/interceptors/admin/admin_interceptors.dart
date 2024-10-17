import 'dart:io';

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
        onRequest: (options, handler) async {
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

  Future<Response> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    String? adminToken = await AppConstants.getCurrentAdminToken();
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

  Future<Response> get({required String endPoint}) async {
    String? adminToken = await AppConstants.getCurrentAdminToken();
    Log.debug("GET API Token : === $adminToken");
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

  Future<Response> patch({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    String? adminToken = await AppConstants.getCurrentAdminToken();
    Log.log("====================");
    Log.error(adminToken);
    Log.log("====================");
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
    //required Map<String, dynamic> data,
    required File imageFile,
    required String imageFieldName,
  }) async {
    String? adminToken = await AppConstants.getCurrentAdminToken();
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
}

/*

import 'package:dio/dio.dart';
import 'dart:io';

Future<void> uploadImage({
  required String url,
  required String filePath,
}) async {
  var dio = Dio();

  try {
    // Create form data
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(filePath, filename: filePath.split('/').last),
    });

    // Send POST request
    var response = await dio.post(
      url,
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),
    );

    // Handle the response
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Failed to upload image');
    }
  } catch (e) {
    print('Error uploading image: $e');
  }
}

 */
