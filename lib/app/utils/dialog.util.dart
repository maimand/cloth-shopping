//

import 'package:app/app/theme/colors_theme.dart';
import 'package:app/app/theme/constants.dart';
import 'package:app/app/theme/text_themes.dart';
import 'package:app/app/widgets/rounded_button.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageDialog {
  static void showSuccessToast({required String message}) {
    Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.BOTTOM,
      titleText: SizedBox(height: 0),
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalContentPadding, vertical: 14),
      messageText: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: ColorStyles.green.shade500,
            size: 24,
          ),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              message,
              style: TextStyles.mediumBody2.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
      backgroundColor: ColorStyles.black10,
    );
  }

  static void showErrorToast({String? message}) {
    Get.snackbar(
      "",
      "",
      titleText: SizedBox(),
      messageText: Row(
        children: [
          Icon(
            Icons.warning_amber_outlined,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              message ?? "Somethings went wrong!!!",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
      backgroundColor: kErrorColor,
    );
  }

  static void showLoading([String? message]) {
    Get.defaultDialog(
      titlePadding: EdgeInsets.all(0),
      content: Column(
        children: [
          CupertinoActivityIndicator(),
          if (message != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                message,
                style: TextStyles.mediumBody2
                    .copyWith(color: ColorStyles.black.shade700),
              ),
            )
        ],
      ),
      radius: 10,
      barrierDismissible: false,
      onWillPop: () async => false,
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  static void confirm(String message,
      {required String title,
      String? confirmButtonText,
      Color? confirmButtonColor,
      String? cancelButtonText,
      Color? cancelButtonColor = Colors.black12,
      TextStyle? errorTextStyle,
      Function? onCancel,
      Function? onConfirmed}) {
    _showDialog(
      content: message,
      title: title,
      contentTextStyle: errorTextStyle ??
          TextStyles.largeSubtitle1.copyWith(color: ColorStyles.black.shade700),
      onClosed: onCancel,
      onConfirmed: onConfirmed,
      confirmButtonText: confirmButtonText,
      confirmButtonColor: confirmButtonColor,
      cancelButtonText: cancelButtonText,
      cancelButtonColor: cancelButtonColor,
      isConfirmDialog: true,
    );
  }

  static void showMessage(String message,
      {required String title,
      TextStyle? contentTextStyle,
      Function? onClosed,
      String? confirmButtonText,
      Function? onConfirmed,
      Color textColor = Colors.black}) {
    _showDialog(
        content: message,
        title: title,
        confirmButtonText: confirmButtonText,
        contentTextStyle: contentTextStyle ??
            TextStyle(
              color: textColor,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
        onClosed: onClosed,
        onConfirmed: onConfirmed,
        isConfirmDialog: false);
  }

  static void showError(
      {String? message,
      String? title,
      String? confirmButtonText,
      TextStyle? contentTextStyle,
      Function? onClosed}) {
    _showDialog(
      content: message ?? 'An error has occurred. Please try again.',
      title: title ?? 'Error',
      confirmButtonText: confirmButtonText,
      contentTextStyle: contentTextStyle ??
          TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
      onClosed: onClosed,
      isConfirmDialog: false,
    );
  }

  static void showSuccessMessagePopup({
    required String message,
  }) {
    Get.generalDialog(
      barrierDismissible: false,
      barrierColor: Color.fromRGBO(0, 0, 0, 0.3),
      transitionDuration: Duration(milliseconds: 0),
      pageBuilder: (context, _, __) {
        return GetPlatform.isIOS
            ? CupertinoAlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/done.png', height: 184),
                    SizedBox(height: 30),
                    Text(
                      "Successfully",
                      style: TextStyles.largeHeading6.copyWith(
                          color: ColorStyles.blue.shade700,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8),
                    Text(
                      message,
                      style: TextStyles.mediumBody2
                          .copyWith(color: ColorStyles.black.shade700),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text(
                      "OK",
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              )
            : AlertDialog(
                content: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 0,
                    minHeight: 30,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/done.png', height: 184),
                      SizedBox(height: 20),
                      Text(
                        "Successfully",
                        style: TextStyles.largeHeading6.copyWith(
                            color: ColorStyles.blue.shade700,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 8),
                      Text(
                        message,
                        style: TextStyles.mediumBody2
                            .copyWith(color: ColorStyles.black.shade700),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                buttonPadding: EdgeInsets.zero,
                actions: <Widget>[
                  RoundedButton(
                    onPressed: () {
                      Get.back();
                    },
                    labelText: "OK",
                    backgroundColor: Colors.transparent,
                    textColor: ColorStyles.blue.shade700,
                  )
                ],
              );
      },
    );
  }

  static void showErrorMessagePopup({
    required String message,
  }) {
    Get.generalDialog(
      barrierDismissible: false,
      barrierColor: Color.fromRGBO(0, 0, 0, 0.3),
      transitionDuration: Duration(milliseconds: 0),
      pageBuilder: (context, _, __) {
        return GetPlatform.isIOS
            ? CupertinoAlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/fail.png', height: 184),
                    SizedBox(height: 30),
                    Text(
                      "Somethings went wrong!!",
                      style: TextStyles.largeHeading6.copyWith(
                          color: Colors.red.shade500,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8),
                    Text(
                      message,
                      style: TextStyles.mediumBody2
                          .copyWith(color: ColorStyles.black.shade700),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text(
                      "OK",
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              )
            : AlertDialog(
                content: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 0,
                    minHeight: 30,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/fail.png', height: 184),
                      SizedBox(height: 20),
                      Text(
                        "Somethings went wrong!!",
                        style: TextStyles.largeHeading6.copyWith(
                            color: Colors.red.shade500,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 8),
                      Text(
                        message,
                        style: TextStyles.mediumBody2
                            .copyWith(color: ColorStyles.black.shade700),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                buttonPadding: EdgeInsets.zero,
                actions: <Widget>[
                  RoundedButton(
                    onPressed: () {
                      Get.back();
                    },
                    labelText: "OK",
                    backgroundColor: Colors.transparent,
                    textColor: ColorStyles.blue.shade700,
                  )
                ],
              );
      },
    );
  }

  static void _showDialog({
    required String title,
    required String content,
    String? confirmButtonText,
    Color? confirmButtonColor,
    String? cancelButtonText,
    Color? cancelButtonColor,
    TextStyle? contentTextStyle,
    Function? onConfirmed,
    Function? onClosed,
    bool isConfirmDialog = false,
  }) {
    Get.generalDialog(
      barrierDismissible: false,
      barrierColor: Color.fromRGBO(0, 0, 0, 0.3),
      transitionDuration: Duration(milliseconds: 0),
      pageBuilder: (context, _, __) {
        return GetPlatform.isIOS
            ? CupertinoAlertDialog(
                title: Text(title),
                content: Text(content),
                actions: [
                  if (isConfirmDialog)
                    CupertinoDialogAction(
                      child: Text(
                        cancelButtonText
                            ?? "Cancel",
                      ),
                      onPressed: () {
                        if (onClosed != null) {
                          Get.back();
                          onClosed();
                        } else {
                          Get.back();
                        }
                      },
                    ),
                  CupertinoDialogAction(
                    child: Text(
                      confirmButtonText!,
                    ),
                    onPressed: () {
                      if (onConfirmed != null) {
                        Get.back();
                        onConfirmed();
                      } else {
                        Get.back();
                      }
                    },
                  ),
                ],
              )
            : AlertDialog(
                title: Text(
                  title,
                  style: TextStyles.largeHeading6
                      .copyWith(color: ColorStyles.black.shade700),
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                content: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 0,
                    minHeight: 30,
                  ),
                  child: Text(
                    content,
                    style: contentTextStyle
                        ?? TextStyles.largeSubtitle1,
                  ),
                ),
                buttonPadding: EdgeInsets.zero,
                actions: <Widget>[
                  if (isConfirmDialog)
                    RoundedButton(
                      onPressed: () {
                        if (onClosed != null) {
                          Get.back();
                          onClosed();
                        } else {
                          Get.back();
                        }
                      },
                      labelText: cancelButtonText
                           ?? 'Cancel'.toUpperCase(),
                      backgroundColor: Colors.transparent,
                      textColor: ColorStyles.black.shade700,
                    ),
                  RoundedButton(
                    onPressed: () {
                      if (onConfirmed != null) {
                        Get.back();
                        onConfirmed();
                      } else {
                        Get.back();
                      }
                    },
                    labelText: confirmButtonText ??
                        "Confirm".toUpperCase(),
                    backgroundColor: Colors.transparent,
                    textColor: confirmButtonColor
                        ?? ColorStyles.blue.shade700,
                  )
                ],
              );
      },
    );
  }

  static void showConfirmDialog({
    required String title,
    required String content,
    String? pathImage,
    String? confirmButtonText,
    Color? confirmButtonColor,
    String? cancelButtonText,
    Function? onConfirmed,
    Function? onClosed,
  }) {
    Get.generalDialog(
      barrierDismissible: false,
      barrierColor: Color.fromRGBO(0, 0, 0, 0.3),
      transitionDuration: Duration(milliseconds: 0),
      pageBuilder: (context, _, __) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          content: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0,
              minHeight: 30,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (pathImage != null)
                    Image.asset(
                      pathImage,
                      height: 184,
                      width: 184,
                    ),
                  Text(
                    title,
                    style: TextStyles.largeHeading6
                        .copyWith(color: ColorStyles.blue.shade700),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      content,
                      style: TextStyles.mediumBody2
                          .copyWith(color: ColorStyles.black.shade700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: Get.width,
                    height: 1,
                    color: ColorStyles.black.shade700,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RoundedButton(
                          onPressed: () {
                            if (onClosed != null) {
                              Get.back();
                              onClosed();
                            } else {
                              Get.back();
                            }
                          },
                          labelText: cancelButtonText
                              ?? "Cancel",
                          backgroundColor: Colors.transparent,
                          textColor: ColorStyles.black.shade700,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 45,
                        color: ColorStyles.black.shade700,
                      ),
                      Expanded(
                        child: RoundedButton(
                          onPressed: () {
                            if (onConfirmed != null) {
                              Get.back();
                              onConfirmed();
                            } else {
                              Get.back();
                            }
                          },
                          labelText:
                              confirmButtonText ?? "Confirm",
                          backgroundColor: Colors.transparent,
                          textColor: confirmButtonColor
                              ?? ColorStyles.blue.shade700,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          buttonPadding: EdgeInsets.zero,
        );
      },
    );
  }

  static void showCustomConfirmDialog({
    required String title,
    required Widget content,
    Color? titleColor,
    String? pathImage,
    String? confirmButtonText,
    Color? confirmButtonColor,
    String? cancelButtonText,
    Function? onConfirmed,
    Function? onClosed,
  }) {
    Get.generalDialog(
      barrierDismissible: false,
      barrierColor: Color.fromRGBO(0, 0, 0, 0.3),
      transitionDuration: Duration(milliseconds: 0),
      pageBuilder: (context, _, __) {
        return GetPlatform.isIOS
            ? CupertinoAlertDialog(
                content: Material(
                  type: MaterialType.transparency,
                  color: Color(0xCCF2F2F2),
                  shadowColor: Color(0xCCF2F2F2),
                  borderOnForeground: false,
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (pathImage != null)
                          Image.asset(
                            pathImage,
                            height: 184,
                            width: 184,
                          ),
                        Text(
                          title,
                          style: TextStyles.largeHeading6.copyWith(
                              color: titleColor
                                  ?? ColorStyles.blue.shade700),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        content,
                      ],
                    ),
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text(
                      cancelButtonText ?? "Cancel",
                      style: TextStyle(
                        backgroundColor: Colors.transparent,
                        color: ColorStyles.black.shade700,
                      ),
                    ),
                    onPressed: () {
                      if (onClosed != null) {
                        Get.back();
                        onClosed();
                      } else {
                        Get.back();
                      }
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      confirmButtonText ?? "Confirm",
                      style: TextStyle(
                        backgroundColor: Colors.transparent,
                        color: ColorStyles.blue.shade700,
                      ),
                    ),
                    onPressed: () {
                      if (onConfirmed != null) {
                        Get.back();
                        onConfirmed();
                      } else {
                        Get.back();
                      }
                    },
                  ),
                ],
              )
            : AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                content: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 0,
                    minHeight: 30,
                  ),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (pathImage != null)
                          Image.asset(
                            pathImage,
                            height: 184,
                            width: 184,
                          ),
                        Text(
                          title,
                          style: TextStyles.largeHeading6.copyWith(
                              color: titleColor
                                  ?? ColorStyles.blue.shade700),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: content,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: Get.width,
                          height: 1,
                          color: ColorStyles.black.shade300,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: RoundedButton(
                                onPressed: () {
                                  if (onClosed != null) {
                                    Get.back();
                                    onClosed();
                                  } else {
                                    Get.back();
                                  }
                                },
                                labelText: cancelButtonText
                                    ?? "Cancel",
                                backgroundColor: Colors.transparent,
                                textColor: ColorStyles.black.shade700,
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 53,
                              color: ColorStyles.black.shade300,
                            ),
                            Expanded(
                              child: RoundedButton(
                                onPressed: () {
                                  if (onConfirmed != null) {
                                    Get.back();
                                    onConfirmed();
                                  } else {
                                    Get.back();
                                  }
                                },
                                labelText: confirmButtonText ??
                                    "Confirm",
                                backgroundColor: Colors.transparent,
                                textColor: confirmButtonColor
                                    ?? ColorStyles.blue.shade700,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                buttonPadding: EdgeInsets.zero,
              );
      },
    );
  }

  static void showSuccessDialog({
    required String message,
  }) {
    Get.generalDialog(
      barrierDismissible: false,
      barrierColor: Color.fromRGBO(0, 0, 0, 0.3),
      transitionDuration: Duration(milliseconds: 0),
      pageBuilder: (context, _, __) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          contentPadding: EdgeInsets.zero,
          content: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0,
              minHeight: 30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/fail.png', height: 184),
                Text(
                  "Thanh Cong",
                  style: TextStyles.largeHeading6
                      .copyWith(color: ColorStyles.blue.shade700),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    message,
                    style: TextStyles.mediumBody2
                        .copyWith(color: ColorStyles.black.shade700),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: Get.width,
                  height: 1,
                  color: ColorStyles.black.shade300,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ),
              ],
            ),
          ),
          buttonPadding: EdgeInsets.zero,
        );
      },
    );
  }

  static void showWarningMessagePopup({
    String? title,
    required String content,
  }) {
    Get.generalDialog(
      barrierDismissible: false,
      barrierColor: Color.fromRGBO(0, 0, 0, 0.3),
      transitionDuration: Duration(milliseconds: 0),
      pageBuilder: (context, _, __) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          contentPadding: EdgeInsets.zero,
          content: Container(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 0,
                minHeight: 70,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          CupertinoIcons.clear,
                          size: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.exclamationmark_triangle_fill,
                            color: Colors.yellow.shade700,
                          ),
                          SizedBox(width: 5),
                          Text(
                           title ?? "Notify",
                            style: TextStyles.largeHeading6
                                .copyWith(color: Colors.yellow.shade700),
                          ),
                        ],
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  Divider(height: 17),
                  Text(
                    content,
                    style: TextStyles.mediumBody2
                        .copyWith(color: ColorStyles.black.shade700),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // static showBackFormEdited() {
  //   showConfirmDialog(
  //     title: LocaleKeys.Share_Confirm.tr,
  //     confirmButtonText: LocaleKeys.Buttons_Quit.tr,
  //     confirmButtonColor: ColorStyles.red.shade700,
  //     onConfirmed: Get.back,
  //     content: LocaleKeys.Share_BackFormEditedMessage.tr,
  //   );
  // }

  // static showBackFormCreate(String content) {
  //   showConfirmDialog(
  //     title: LocaleKeys.Share_Confirm.tr,
  //     confirmButtonText: LocaleKeys.Buttons_Quit.tr,
  //     confirmButtonColor: ColorStyles.red.shade700,
  //     onConfirmed: Get.back,
  //     content: content,
  //   );
  // }
}
