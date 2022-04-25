// import 'package:eldesk/common/theme/app_colors.dart';
// import 'package:eldesk/common/theme/constants.dart';
// import 'package:eldesk/generated/locales.g.dart';
// import 'package:flutter/material.dart';
// import 'package:keyboard_actions/keyboard_actions.dart';
// import 'package:get/get.dart';

// class KeyboardHelper {
//   static KeyboardActionsConfig config(
//       {required FocusNode node, Function()? onSubmit}) {
//     return KeyboardActionsConfig(
//       keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
//       keyboardBarColor: Colors.grey[200],
//       nextFocus: false,
//       actions: [
//         KeyboardActionsItem(
//           focusNode: node,
//           toolbarButtons: [
//             (node) {
//               return GestureDetector(
//                 onTap: () {
//                   if (onSubmit != null) {
//                     onSubmit();
//                   }
//                   node.unfocus();
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: kHorizontalContentPadding),
//                   child: Text(
//                     LocaleKeys.Task_Done.tr,
//                     style: TextStyle(
//                         color: ColorStyles.kPrimaryColor,
//                         fontWeight: FontWeight.w700),
//                   ),
//                 ),
//               );
//             }
//           ],
//         ),
//       ],
//     );
//   }
// }
