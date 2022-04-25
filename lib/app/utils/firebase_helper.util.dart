// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class FirebaseHelper {
//   static String getTopicByUserId(int userId) {
//     return "user-$userId";
//   }

//   static Future<void> firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     await Firebase.initializeApp();
//     // Update badge number for android device
//     // iOS device is automatically updated by OS
//     // if (Platform.isAndroid) {
//     //   try {
//     //     FirebaseNotificationModel notificationModel =
//     //     FirebaseNotificationModel.fromJson(message.data);
//     //     FlutterAppBadger.updateBadgeCount(notificationModel.badge);
//     //   } catch (e) {}
//     // }
//   }

//   static Future<NotificationSettings>
//   requestIOSNotificationPermissions() async {
//     return await FirebaseMessaging.instance.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//   }

//   static Future<void> initFirebase() async {
//     if (GetPlatform.isIOS) {
//       NotificationSettings settings = await requestIOSNotificationPermissions();
//       //
//       if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//         debugPrint('User granted permission');
//       } else if (settings.authorizationStatus ==
//           AuthorizationStatus.provisional) {
//         debugPrint('User granted provisional permission');
//       } else {
//         debugPrint('User declined or has not accepted permission');
//         requestIOSNotificationPermissions();
//       }
//     }

//     /// Update the iOS foreground notification presentation options to allow
//     /// heads up notifications.
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: false,
//       badge: false,
//       sound: false,
//     );
//   }
// }
