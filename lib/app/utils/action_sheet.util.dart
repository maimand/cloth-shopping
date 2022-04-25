import 'dart:io';
import 'package:app/app/theme/colors_theme.dart';
import 'package:app/app/theme/text_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// Display a platform dependent Action Sheet
class PlatformActionSheetHelper {
  /// Function to display the sheet
  static void displaySheet(
      {Widget? title,
      Widget? message,
      required List<ActionSheetAction> actions}) {
    if (Platform.isIOS) {
      _showCupertinoActionSheet(
        title: title,
        message: message,
        actions: actions,
      );
    } else {
      _settingModalBottomSheet(
        title: title,
        message: message,
        actions: actions,
      );
    }
  }

  static void _showCupertinoActionSheet(
      {Widget? title,
      Widget? message,
      required List<ActionSheetAction> actions}) {
    final noCancelOption = -1;
    // Cancel action is treated differently with CupertinoActionSheets
    var indexOfCancel = actions.lastIndexWhere((action) => action.isCancel);
    CupertinoActionSheet actionSheet;
    actionSheet = indexOfCancel == noCancelOption
        ? CupertinoActionSheet(
            title: title,
            message: message,
            actions: actions
                .where((action) => !action.isCancel)
                .map<Widget>(_cupertinoActionSheetActionFromAction)
                .toList())
        : CupertinoActionSheet(
            title: title,
            message: message,
            actions: actions
                .where((action) => !action.isCancel)
                .map<Widget>(_cupertinoActionSheetActionFromAction)
                .toList(),
            cancelButton:
                _cupertinoActionSheetActionFromAction(actions[indexOfCancel]));
    //
    Get.bottomSheet(
      actionSheet,
      backgroundColor: Colors.transparent,
      isScrollControlled: false,
    );
  }

  static CupertinoActionSheetAction _cupertinoActionSheetActionFromAction(
          ActionSheetAction action) =>
      CupertinoActionSheetAction(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: action.centerAction!
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (action.icon != null) action.icon!,
              if (action.icon != null) SizedBox(width: 15),
              Text(
                action.text,
                style: TextStyles.mediumBody2.copyWith(
                  color: ColorStyles.black10,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        onPressed: () {
          Get.back();
          action.onPressed();
        },
        isDefaultAction: action.defaultAction,
        isDestructiveAction: action.isCancel,
      );

  static ListTile _listTileFromAction(ActionSheetAction action) => action
          .hasArrow
      ? ListTile(
          horizontalTitleGap: 0,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          title: Text(
            action.text,
            style: TextStyles.mediumBody2.copyWith(
              color: ColorStyles.black10,
            ),
          ),
          onTap: () {
            Get.back();
            action.onPressed();
          },
          leading: action.icon,
          trailing: Icon(Icons.keyboard_arrow_right),
        )
      : ListTile(
          horizontalTitleGap: 0,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          title: Text(
            action.text,
            textAlign: action.centerAction! ? TextAlign.center : TextAlign.left,
            style: TextStyles.mediumBody2.copyWith(
                color: ColorStyles.black10,
                fontWeight:
                    action.defaultAction ? FontWeight.bold : FontWeight.normal),
          ),
          leading: action.icon,
          onTap: () {
            Get.back();
            action.onPressed();
          },
        );

  static void _settingModalBottomSheet(
      {Widget? title,
      Widget? message,
      required List<ActionSheetAction> actions}) {
    if (actions.isNotEmpty) {
      final actionSheet = Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (title != null) title,
            if (message != null) message,
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              itemCount: actions.length,
              itemBuilder: (_, index) => _listTileFromAction(actions[index]),
              separatorBuilder: (_, index) => Divider(height: 0),
            ),
          ],
        ), // Separator above the last option only
      );
      //
      Get.bottomSheet(
        actionSheet,
        backgroundColor: Colors.white,
        isScrollControlled: false,
      );
    }
  }
}

/// Data class for Actions in ActionSheet
class ActionSheetAction {
  /// Text to display
  final String text;

  final Widget? icon;

  final bool? centerAction;

  /// The function which will be called when the action is pressed
  final VoidCallback onPressed;

  /// Is this a default action - especially for iOS
  final bool defaultAction;

  /// This is a cancel option - especially for iOS
  final bool isCancel;

  /// on Android indicates that further options are next
  final bool hasArrow;

  /// Construction of an ActionSheetAction
  ActionSheetAction({
    required this.text,
    required this.onPressed,
    this.icon,
    this.centerAction = false,
    this.defaultAction = false,
    this.isCancel = false,
    this.hasArrow = false,
  });
}
