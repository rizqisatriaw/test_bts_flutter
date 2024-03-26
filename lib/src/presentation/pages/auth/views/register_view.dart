import 'package:bts_test/configs/routes/main_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../configs/themes/color_themes.dart';
import '../../../../../configs/helpers/validator_helper.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_form.dart';
import '../controllers/auth_controller.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

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
                  title: 'Register to BTS.id',
                  size: 24.sp,
                  weight: FontWeight.w800,
                ),
                SizedBox(height: 34.h),

                /// Form Email
                CustomText(
                  title: 'Email',
                  size: 13.sp,
                  weight: FontWeight.w400,
                  colorText: ColorThemes.secondaryColor,
                ),
                SizedBox(height: 4.h),
                CustomTextForm(
                  isPass: false,
                  obscure: false,
                  controller: controller.emailController,
                  validator: (email) {
                    final error = Validator.emailAddress(
                      value: email,
                    );
                    controller.debounce.run(() {
                      controller.isRegisterButtonEnabled(error == null);
                    });
                    return error;
                  },
                ),
                SizedBox(height: 16.h),

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
                    validator: (password) {
                      final error = Validator.password(
                        length: 6,
                        value: password,
                      );
                      controller.debounce.run(() {
                        controller.isRegisterButtonEnabled(error == null);
                      });
                      return error;
                    },
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
                SizedBox(height: 36.h),

                /// Button Register
                CustomButton(
                  onTap: () => controller.postRegister(),
                  isEnable: true,
                  isBorder: false,
                  title: 'Register',
                ),
                SizedBox(height: 14.h),

                /// Text to Login
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        title: 'Apakah anda sudah memiliki akun?',
                        size: 14.sp,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(MainRoute.login),
                        child: CustomText(
                          title: '  Login',
                          size: 16.sp,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
