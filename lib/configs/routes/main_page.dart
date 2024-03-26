import 'package:get/get.dart';

import '../../src/presentation/pages/auth/bindings/auth_binding.dart';
import '../../src/presentation/pages/auth/views/login_view.dart';
import '../../src/presentation/pages/auth/views/register_view.dart';
import '../../src/presentation/pages/list_checklist/bindigs/checlist_binding.dart';
import '../../src/presentation/pages/list_checklist/views/check_list_view.dart';
import 'main_route.dart';

abstract class MainPage {
  static final main = [
    /// GetPage Login
    GetPage(
      name: MainRoute.login,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),

    /// GetPage Login
    GetPage(
      name: MainRoute.register,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),

    /// GetPage ListCheckList
    GetPage(
      name: MainRoute.listChecklist,
      page: () => const CheckListView(),
      binding: CheckListBinding(),
    ),
    //
    // /// GetPage ItemCheckList
    // GetPage(
    //   name: MainRoute.itemChecklist,
    //   page: () => const ItemChecklistView(),
    //   binding: ItemChecklistBinding(),
    // ),
  ];
}
