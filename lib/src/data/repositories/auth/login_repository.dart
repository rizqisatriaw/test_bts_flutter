import 'package:dio/dio.dart';

import '../../../../configs/constants/api_const.dart';
import '../../responses/auth/login_response.dart';
import '../../services/global_dio.dart';

class LoginRepository {
  static Future<LoginResponse?> postLogin(
      String username, String password) async {
    try {
      Map<String, dynamic> data = {
        "username": username,
        "password": password,
      };

      final response = await globalDio.post(
        ApiConst.loginUrl,
        data: data,
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        return LoginResponse(
          statusCode: 400,
          message: 'Connection Error',
        );
      } else {
        return LoginResponse(
          statusCode: 500,
          message: 'Server Error',
        );
      }
    }
  }
}
