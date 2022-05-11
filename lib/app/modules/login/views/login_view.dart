import 'package:app/app/routes/app_pages.dart';
import 'package:app/app/theme/colors_theme.dart';
import 'package:app/app/theme/constants.dart';
import 'package:app/app/theme/text_themes.dart';
import 'package:app/app/utils/app_input.widget.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.only(
              // move the screen up and avoid bottom padding is less than 0
              bottom: MediaQuery.of(context).viewInsets.bottom - 20.0 > 0
                  ? MediaQuery.of(context).viewInsets.bottom - 20.0
                  : 0),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kHorizontalContentPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/logo.png', width: 60),
                      Text(
                        'Login',
                        style: TextStyles.mediumButton
                            .copyWith(color: ColorStyles.blue.shade700),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Start Shopping with your freedom",
                    style: TextStyles.largeHeading4.copyWith(
                      color: ColorStyles.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Get to the app",
                    style: TextStyles.mediumBody2.copyWith(
                      color: ColorStyles.black.shade700,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Email",
                    style: TextStyles.smallSmall.copyWith(
                      color: ColorStyles.black5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppInput(
                          controller: controller.emailController,
                          textCapitalization: TextCapitalization.none,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Password required",
                              ),
                              // CustomEmailValidator(
                              //   errorText: LocaleKeys.Login_EmailInvalid.tr,
                              // ),
                            ],
                          ),
                          suffixIcon: !controller.isValidEmail.value
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: GestureDetector(
                                    onTap: () => controller.clearEmail(),
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                      size: 22,
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Nhập email',
                          onChanged: (email) {
                            // controller.checkIsEnterFullField();
                            // controller.resetEmailValid();
                          },
                          isCustomError: true,
                        ),
                        // if (!controller.isValidEmail.value)
                        //   Padding(
                        //     padding: const EdgeInsets.only(top: 6.0, left: 8.0),
                        //     child: Text(
                        //       LocaleKeys.Login_EmailInvalid.tr,
                        //       style: TextStyles.smallCaption
                        //           .copyWith(color: Colors.red.shade800),
                        //     ),
                        //   ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Password",
                    style: TextStyles.smallSmall.copyWith(
                      color: ColorStyles.black5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => AppInput(
                      textCapitalization: TextCapitalization.none,
                      controller: controller.passwordController,
                      validator: MultiValidator(
                        [
                          RequiredValidator(
                            errorText:
                                "Password required",
                          ),
                        ],
                      ),
                      hintText: "Enter Password",
                      obscureText:
                          controller.isVisiblePassword.value ? true : false,
                      onChanged: (password) {
                        // controller.checkIsEnterFullField();
                        // controller.checkPasswordEmpty();
                      },
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "Forget pasword",
                      style: TextStyles.mediumButton.copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorStyles.blue.shade600),
                    ),
                    onPressed: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                  ),
                  const SizedBox(height: 28),
                  // Obx(
                  //   () => RoundedButton(
                  //     backgroundColor: controller.isActiveLoginButton.value
                  //         ? ColorStyles.blue.shade700
                  //         : ColorStyles.black.shade100,
                  //     labelText: LocaleKeys.Buttons_login.tr,
                  //     isBorder: !controller.isActiveLoginButton.value,
                  //     borderColor: ColorStyles.black5,
                  //     width: Get.width,
                  //     textColor: controller.isActiveLoginButton.value
                  //         ? ColorStyles.white
                  //         : ColorStyles.black5,
                  //     disabled: controller.isProcessing.value,
                  //     margin: const EdgeInsets.only(top: 12),
                  //     onPressed: () {
                  //       if (_formKey.currentState!.validate()) {
                  //         controller.loginUser();
                  //       }
                  //     },
                  //   ),
                  // ),
                  // RoundedButton(
                  //   backgroundColor: OldAppColors.kWhite,
                  //   icon: Image.asset(
                  //     'assets/icons/google.png',
                  //     width: 20,
                  //   ),
                  //   labelText: LocaleKeys.Login_LoginWithGoogle.tr,
                  //   textColor: ColorStyles.black10,
                  //   borderColor: OldAppColors.gray.shade300,
                  //   isBorder: true,
                  //   width: Get.width,
                  //   disabled: controller.isProcessing.value,
                  //   margin: const EdgeInsets.only(top: 12),
                  //   onPressed: () {
                  //     // TODO: login with google
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: kHorizontalContentPadding,
          bottom: 20,
        ),
        child: Text.rich(
          TextSpan(
            children: [
              // TextSpan(
              //     text: LocaleKeys.Login_HaveNotAccount.tr,
              //     style: TextStyles.largeSubtitle1),
              // TextSpan(
              //   text: LocaleKeys.Login_SignUpLabelButton.tr,
              //   style: TextStyles.largeSubtitle1
              //       .copyWith(color: ColorStyles.blue.shade700),
              //   recognizer: TapGestureRecognizer()
              //     ..onTap = () {
              //       Get.toNamed(AuthRoutes.REGISTER);
              //     },
              // ),
              // TextSpan(
              //     text: LocaleKeys.Login_Now.tr,
              //     style: TextStyles.largeSubtitle1),
            ],
          ),
        ),
      ),
    );
  }
}
