import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../../../../configs/routes/main_route.dart';
import '../../../../../configs/themes/color_themes.dart';
import '../../../widgets/custom_item_list.dart';
import '../../../widgets/custom_text.dart';
import '../controllers/checklist_controller.dart';

class CheckListView extends StatelessWidget {
  const CheckListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CheckListController.to;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorThemes.whiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StickyHeader(
                    /// Title Header
                    header: Container(
                      alignment: Alignment.centerLeft,
                      width: Get.width,
                      color: ColorThemes.whiteColor,
                      child: Column(
                        children: [
                          SizedBox(height: 24.w),
                          CustomText(
                            title: 'Halaman List CheckList',
                            size: 17.sp,
                            weight: FontWeight.w500,
                          ),
                          SizedBox(height: 24.w),
                        ],
                      ),
                    ),

                    /// List Check List
                    content: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = controller.checkList[index];
                        return CustomItemList(
                          onTap: () => Get.toNamed(
                            MainRoute.itemChecklist,
                            arguments: item,
                          ),
                          name: item.name ?? '',
                          onTapDelete: () {},
                          onTapSave: () {},
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8.h,
                      ),
                      itemCount: controller.checkList.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
