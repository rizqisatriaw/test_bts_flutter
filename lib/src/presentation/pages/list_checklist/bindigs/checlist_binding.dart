import 'package:get/get.dart';

import '../controllers/checklist_controller.dart';

class CheckListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CheckListController());
  }
}
