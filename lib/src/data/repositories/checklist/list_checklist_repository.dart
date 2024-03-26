import 'package:bts_test/src/data/responses/checklist/list_checklist_response.dart';
import 'package:dio/dio.dart';

import '../../../../configs/constants/api_const.dart';
import '../../services/global_dio.dart';

class ListChecklistRepository {
  static Future<ListChecklistResponse?> fetchListCheckList() async {
    try {
      final response = await globalDio.get(ApiConst.checkListUrl);

      return ListChecklistResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        return ListChecklistResponse(
            statusCode: 400, errorMessage: 'Connection Error');
      } else {
        return ListChecklistResponse(
          statusCode: 500,
          errorMessage: 'Server Error',
        );
      }
    }
  }
}
