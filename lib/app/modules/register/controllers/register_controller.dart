import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();

  // UserRegisterRequestModel userRegister = UserRegisterRequestModel();

  RxBool isProcessing = RxBool(false);
  RxBool isActiveSubmitButton = RxBool(false);
  RxBool isAgreeWithTermsAndConditions = RxBool(false);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  void checkIsEnterEmailCorrectly() {
    if (emailController.text.isEmail && isAgreeWithTermsAndConditions.value) {
      isActiveSubmitButton(true);
    } else {
      isActiveSubmitButton(false);
    }
  }

  Future<void> registerRequest() async {
    if(!isActiveSubmitButton.value) return;
    // try {
    //   userRegister.email = emailController.text.toLowerCase();

    //   HttpResponse tokenResponse =
    //       await repository.registerRequest(userRegister);
    //   if (tokenResponse.statusCode == 200) {
    //     Get.toNamed(AuthRoutes.REGISTER_CONFIRM);
    //   } else {
    //     MessageDialog.showError(
    //       message: LocaleKeys.Register_CheckData.tr,
    //       title: LocaleKeys.Register_SignUpFail.tr,
    //       confirmButtonText: 'OK',
    //     );
    //   }
    // } on DioError catch (e) {
    //   print(e.response!.statusCode);
    //   if (e.response!.statusCode == 400) {
    //     MessageDialog.showError(
    //       message: LocaleKeys.Register_EmailExist.tr,
    //       title: LocaleKeys.Register_SignUpFail.tr,
    //       confirmButtonText: 'OK',
    //     );
    //   } else {
    //     MessageDialog.showError(
    //       message: LocaleKeys.Register_CheckData.tr,
    //       title: LocaleKeys.Register_SignUpFail.tr,
    //       confirmButtonText: 'OK',
    //     );
    //   }
    //   isProcessing.value = false;
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  void toggleAgreeWithTermsAndConditions() {
    isAgreeWithTermsAndConditions(!isAgreeWithTermsAndConditions.value);
    if (emailController.text.isEmail && isAgreeWithTermsAndConditions.value) {
      isActiveSubmitButton(true);
    } else {
      isActiveSubmitButton(false);
    }
  }
}
