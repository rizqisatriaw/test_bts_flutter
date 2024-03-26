import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../configs/constants/api_const.dart';
import '../../responses/auth/register_response.dart';
import '../../services/global_dio.dart';

class RegisterRepository {
  static Future<RegisterResponse?> postRegister(
    String email,
    String username,
    String password,
  ) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "username": username,
        "password": password,
      };

      final response = await globalDio.post(
        ApiConst.registerUrl,
        data: data,
      );
      log(response.statusCode.toString());
      return RegisterResponse.fromJson(
        response.data,
      );
    } on DioException catch (e) {
      log(e.toString());
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        return RegisterResponse(
            statusCode: 400, errorMessage: 'Connection Error');
      } else {
        return RegisterResponse(
          statusCode: 500,
          errorMessage: 'Server Error',
        );
      }
    }
  }
}
