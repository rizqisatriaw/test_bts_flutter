import 'dart:developer';

import 'package:bts_test/src/data/repositories/checklist/list_checklist_repository.dart';
import 'package:bts_test/src/data/responses/checklist/list_checklist_response.dart';
import 'package:get/get.dart';

import '../../../../../configs/themes/color_themes.dart';

class CheckListController extends GetxController {
  static CheckListController get to => Get.find();

  RxInt dataOffset = RxInt(1);
  RxInt totalData = RxInt(0);
  RxBool isLoading = RxBool(false);
  RxList<Data> checkList = RxList.empty();

  @override
  void onInit() {
    fetchListChecklist(offset: 1);
    super.onInit();
  }

  Future<void> fetchListChecklist({int? offset}) async {
    try {
      isLoading.value = true;
      if (offset != null) {
        dataOffset.value = offset;
      }
      final response = await ListChecklistRepository.fetchListCheckList();
      if (response?.statusCode == 2100) {
        checkList.addAll(response?.data ?? []);

        isLoading.value = false;
      }
    } catch (e, s) {
      log('$e :: $s');
      Get.snackbar(
        'Data is Empty',
        'Please try again later',
        backgroundColor: ColorThemes.whiteColor,
      );
    }
  }
}
