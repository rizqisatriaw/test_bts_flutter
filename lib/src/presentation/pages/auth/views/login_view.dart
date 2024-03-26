import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../configs/routes/main_route.dart';
import '../../../../../configs/themes/color_themes.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_form.dart';
import '../controllers/auth_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final controller = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorThemes.whiteColor,
        body: Padding(
          padding: EdgeInsets.all(24.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// Title
                CustomText(
                  title: 'Login to BTS.id',
                  size: 24.sp,
                  weight: FontWeight.w800,
                ),
                SizedBox(height: 34.h),

                /// Form Username
                CustomText(
                  title: 'Username',
                  size: 13.sp,
                  weight: FontWeight.w400,
                  colorText: ColorThemes.secondaryColor,
                ),
                SizedBox(height: 4.h),
                CustomTextForm(
                  isPass: false,
                  obscure: false,
                  controller: controller.usernameController,
                ),
                SizedBox(height: 16.h),

                /// Form Password
                CustomText(
                  title: 'Password',
                  size: 13.sp,
                  weight: FontWeight.w400,
                  colorText: ColorThemes.secondaryColor,
                ),
                SizedBox(height: 4.h),
                Obx(
                  () => CustomTextForm(
                    isPass: true,
                    obscure: controller.obscureText.value,
                    controller: controller.passwordController,
                    gestureDetector: GestureDetector(
                      child: Icon(
                        controller.obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onTap: () {
                        controller.obscureText.toggle();
                      },
                    ),
                  ),
                ),

                /// CheckBox
                Row(
                  children: <Widget>[
                    Obx(
                      () => Checkbox(
                        checkColor: ColorThemes.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.r))),
                        side: BorderSide(color: ColorThemes.hoverColor),
                        visualDensity: VisualDensity.compact,
                        value: controller.isChecked.value,
                        onChanged: (value) {
                          controller.isChecked.value = value!;
                        },
                      ),
                    ),
                    CustomText(
                      title: 'Remember me',
                      size: 15.sp,
                      weight: FontWeight.w400,
                      colorText: ColorThemes.primaryColor,
                    )
                  ],
                ),
                SizedBox(height: 36.h),

                /// Button Login
                CustomButton(
                  onTap: () => controller.postLogin(),
                  isEnable: true,
                  isBorder: false,
                  title: 'Log in',
                ),
                SizedBox(height: 16.h),

                /// Text to Register
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        title: 'Apakah anda belum memiliki akun?',
                        size: 14.sp,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(MainRoute.register),
                        child: CustomText(
                          title: '  Register',
                          size: 16.sp,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
