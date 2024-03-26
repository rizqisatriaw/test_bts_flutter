import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/color_themes.dart';
import 'custom_text.dart';

class CustomItemList extends StatelessWidget {
  const CustomItemList({
    Key? key,
    required this.name,
    required this.onTap,
    required this.onTapDelete,
    required this.onTapSave,
  }) : super(key: key);

  final String name;
  final VoidCallback onTap;
  final VoidCallback onTapDelete;
  final VoidCallback onTapSave;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: ColorThemes.secondaryColor),
          color: ColorThemes.whiteColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Name
                    CustomText(
                      title: name,
                      size: 14.sp,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.file_download_outlined),
                color: ColorThemes.blackColor,
                iconSize: 24.sp,
                onPressed: onTapSave,
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                color: ColorThemes.blackColor,
                iconSize: 24.sp,
                onPressed: onTapDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
