import 'package:app/app/utils/dialog.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isProcessing = RxBool(false);
  RxBool isVisiblePassword = RxBool(true);

  RxBool isActiveLoginButton = RxBool(false);

  // this value is for validate email when user tap login,
  // we set it to true everytime it email controller change but when validate it, set it false if it is not a email
  RxBool isValidEmail = RxBool(true);
  RxBool isShowPasswordInspector = RxBool(false);

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
    passwordController.dispose();
    super.onClose();
  }

  void checkEmailValid() {
    isValidEmail.value = emailController.text.isEmail;
  }

  void checkIsEnterFullField() {
    isActiveLoginButton.value =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  void resetEmailValid() {
    // update validate email again
    isValidEmail.value = true;
  }

  void clearEmail() {
    emailController.clear();
    isValidEmail.value = true;
  }

  void checkPasswordEmpty() {
    if (passwordController.text.isNotEmpty) {
      isShowPasswordInspector.value = true;
    } else {
      isShowPasswordInspector.value = false;
    }
  }

  Future<void> loginUser() async {
    checkEmailValid();
    // if (!(isActiveLoginButton.value && isValidEmail.value)) return;
    // isProcessing.value = true;
    // MessageDialog.showLoading();
    // try {
    //   /// Get tokens
    //   final user = UserLoginCredentials(
    //     username: emailController.text.toLowerCase(),
    //     password: passwordController.text.trim(),
    //   );
    //   final Either<Failure, UserLoginResponse> loginResponse = await userLoginUseCase(user);
    //   loginResponse.fold((error) {
    //     throw error;
    //   }, (tokens) async {
    //     await _authController.setTokens(
    //       accessToken: tokens.accessToken,
    //       refreshToken: tokens.refreshToken,
    //       expiredDuration: tokens.expiresIn,
    //     );
    //   });
    //   /// Get UserProfile
    //   HttpResponse profileResponse = await repository.getProfile();
    //   final UserModel loggedUser = UserModel.fromJson(profileResponse.body);
    //   await _authController.setLoggedUser(loggedUser);
    //   //
    //   isProcessing.value = false;
    // } on DioError catch (e) {
    //   MessageDialog.hideLoading();
    //   _authController.logout();
    //   //
    //   if (e.response!.statusCode == 401) {
    //     MessageDialog.showError(
    //       message: LocaleKeys.Login_EmailOrPasswordIncorrect.tr,
    //       title: LocaleKeys.Login_SignUpFail.tr,
    //       confirmButtonText: 'OK',
    //     );
    //   } else {
    //     MessageDialog.showError(
    //       message: LocaleKeys.Login_EmailOrPasswordIncorrect.tr,
    //       title: LocaleKeys.Login_SignUpFail.tr,
    //       confirmButtonText: 'OK',
    //     );
    //   }
    //   isProcessing.value = false;
    // } catch (e) {
    //   MessageDialog.hideLoading();
    //   _authController.logout();
    //   MessageDialog.showError(
    //     message: LocaleKeys.Login_EmailOrPasswordIncorrect.tr,
    //     title: LocaleKeys.Login_SignUpFail.tr,
    //     confirmButtonText: 'OK',
    //   );
    // } finally {
    //   isProcessing.value = false;
    // }
  }

  void toggleVisiblePassword() {
    isVisiblePassword(!isVisiblePassword.value);
  }
}
