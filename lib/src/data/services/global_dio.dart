import 'package:dio/dio.dart';

import '../../../configs/constants/api_const.dart';
import 'local_storage_service.dart';

Dio globalDio = Dio(
  BaseOptions(
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${LocalStorageService.token}',
    },
    baseUrl: ApiConst.baseUrl,
    contentType: "application/json",
    responseType: ResponseType.json,
    connectTimeout: const Duration(milliseconds: 10000),
  ),
);
