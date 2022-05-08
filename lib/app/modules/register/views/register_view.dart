import 'package:app/app/theme/colors_theme.dart';
import 'package:app/app/theme/constants.dart';
import 'package:app/app/theme/text_themes.dart';
import 'package:app/app/utils/app_input.widget.dart';
import 'package:app/app/utils/dialog.util.dart';
import 'package:app/app/widgets/rounded_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool checkCanRegister() {
    if (!_formKey.currentState!.validate()) return false;
    if (controller.isAgreeWithTermsAndConditions.value) return true;

    MessageDialog.showError(
      message: "Please agree with the policy",
      title: "Register not successfully",
      confirmButtonText: 'OK',
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: kHorizontalContentPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ),
                      Text(
                        "Login",
                        style: TextStyles.mediumButton
                            .copyWith(color: ColorStyles.black.shade700),
                      )
                    ]),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    "Register new account",
                    style: TextStyles.largeHeading4
                        .copyWith(color: ColorStyles.black10),
                  ),
                  SizedBox(height: 28),
                  Text(
                    "Email",
                    style: TextStyles.smallSmall.copyWith(
                        color: ColorStyles.black5, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  AppInput(
                    textCapitalization: TextCapitalization.none,
                    controller: controller.emailController,
                    hintText: "Enter information",
                    validator: MultiValidator(
                      [
                        RequiredValidator(
                          errorText: "Email required",
                        ),
                        EmailValidator(
                          errorText: "Wrong format email",
                        ),
                      ],
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (email) {
                      controller.checkIsEnterEmailCorrectly();
                    },
                  ),
                  SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                        child: Obx(
                          () => GestureDetector(
                              onTap: () {
                                controller.toggleAgreeWithTermsAndConditions();
                              },
                              child: controller
                                      .isAgreeWithTermsAndConditions.value
                                  ? Image.asset(
                                      'assets/icons/checked.png',
                                      width: 24,
                                    )
                                  : Image.asset('assets/icons/unchecked.png',
                                      width: 24)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: 20,
            right: kHorizontalContentPadding,
            left: kHorizontalContentPadding),
        child: Obx(
          () => RoundedButton(
            backgroundColor: controller.isActiveSubmitButton.value
                ? ColorStyles.blue.shade700
                : ColorStyles.black.shade100,
            textColor: controller.isActiveSubmitButton.value
                ? ColorStyles.white
                : ColorStyles.black5,
            labelText: "Continue",
            width: Get.width,
            isBorder: !controller.isActiveSubmitButton.value,
            borderColor: ColorStyles.black5,
            margin: const EdgeInsets.only(top: 24),
            onPressed: () {
              controller.registerRequest();
            },
          ),
        ),
      ),
    );
  }
}
