// // ignore_for_file: avoid_print

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';

// import '../Models/models_export.dart';
// import '../Constants/constants_export.dart';
// import '../Common_Function/comman_functions_export.dart';
// import '../Common_Packages/InApp_Notification_Package/inapp_notification_package_export.dart';

// class AwesomeNotificationService {
//   // Use this method to initialize awesome notification...

//   static Future<void> initializeAwesomeNotification() async {
//     await AwesomeNotificationsFcm().initialize(
//       onFcmSilentDataHandle: mySilentDataHandle,
//       onFcmTokenHandle: myFcmTokenHandle,
//       onNativeTokenHandle: myNativeTokenHandle,
//       licenseKeys: [
//         // AN_FCM_KEY_ROOT,
//         // AN_FCM_KEY_DEBUG,
//         // Constants.AN_FCM_KEY_PROD,
//         // AN_FCM_KEY_DEV,
//         // Constants.AN_FCM_KEY_QA,
//         // AN_FCM_KEY_SHAKS
//       ],
//       debug: false,
//     );

//     await AwesomeNotifications().initialize(
//       'resource://drawable/favicon',
//       [
//         NotificationChannel(
//           channelKey: 'friend_request',
//           channelName: 'friend_request',
//           channelDescription: 'Notification channel for question notifications',
//           importance: NotificationImportance.High,
//           channelShowBadge: true,
//           playSound: true,
//           enableLights: true,
//           enableVibration: true,
//         ),
//         NotificationChannel(
//           channelKey: 'question',
//           channelName: 'question',
//           channelDescription: 'Notification channel for question notifications',
//           importance: NotificationImportance.High,
//           channelShowBadge: true,
//           playSound: true,
//           enableLights: true,
//           enableVibration: true,
//         ),
//         NotificationChannel(
//           channelKey: 'alert',
//           channelName: 'alert',
//           channelDescription: 'Notification channel for alert notifications',
//           importance: NotificationImportance.High,
//           channelShowBadge: true,
//           playSound: true,
//           enableLights: true,
//           enableVibration: true,
//         ),
//         NotificationChannel(
//           channelKey: 'warning',
//           channelName: 'warning',
//           channelDescription: 'Notification channel for warning notifications',
//           importance: NotificationImportance.High,
//           channelShowBadge: true,
//           playSound: true,
//           enableLights: true,
//           enableVibration: true,
//         ),
//         NotificationChannel(
//           channelKey: 'information',
//           channelName: 'information',
//           channelDescription:
//               'Notification channel for information notifications',
//           importance: NotificationImportance.High,
//           channelShowBadge: true,
//           playSound: true,
//           enableLights: true,
//           enableVibration: true,
//         ),
//         NotificationChannel(
//           channelKey: 'success',
//           channelName: 'success',
//           channelDescription: 'Notification channel for success notifications',
//           importance: NotificationImportance.High,
//           channelShowBadge: true,
//           playSound: true,
//           enableLights: true,
//           enableVibration: true,
//         ),
//         NotificationChannel(
//           channelKey: 'chat_message',
//           channelName: 'chat_message',
//           channelDescription: 'Notification channel for success notifications',
//           importance: NotificationImportance.High,
//           channelShowBadge: true,
//           playSound: true,
//           enableLights: true,
//           enableVibration: true,
//         ),
//       ],
//       channelGroups: [
//         NotificationChannelGroup(
//           channelGroupKey: 'oneplay',
//           channelGroupName: 'Group 1',
//         ),
//       ],
//       debug: false,
//     );

//     await requestNotificationPermissions();

//     Future.delayed(const Duration(milliseconds: 500), () async {
//       await AwesomeNotifications().setListeners(
//         onActionReceivedMethod: onActionReceivedMethod,
//         onNotificationCreatedMethod: onNotificationCreatedMethod,
//         onNotificationDisplayedMethod: onNotificationDisplayedMethod,
//         onDismissActionReceivedMethod: onDismissActionReceivedMethod,
//       );
//     });
//   }

//   //----------------------

//   // Use this method to execute on background when a silent data arrives
//   static Future<void> mySilentDataHandle(FcmSilentData silentData) async {
//     print('----- SilentData: $silentData -----');

//     if (silentData.createdLifeCycle != NotificationLifeCycle.Foreground) {
//       print('----- Background -----');
//     } else {
//       print('----- Foreground -----');
//     }
//   }

//   /// Use this method to detect when a new fcm token is received
//   static Future<void> myFcmTokenHandle(String token) async {
//     print('----- FCM Token: $token -----');
//   }

//   /// Use this method to detect when a new native token is received
//   static Future<void> myNativeTokenHandle(String token) async {
//     print('----- Native token: $token -----');
//   }

//   //----------------------

//   // Use this method to detect when a new notification or a schedule is created...
//   static Future<void> onNotificationCreatedMethod(
//     ReceivedNotification receivedNotification,
//   ) async {
//     // updateNotificationList.value = true;

//     print(
//         '----- onNotificationCreatedMethod: ${receivedNotification.payload} ------');
//   }

//   // Use this method to detect every time that a new notification is displayed...
//   static Future<void> onNotificationDisplayedMethod(
//     ReceivedNotification receivedNotification,
//   ) async {
//     print('------ call onNotificationDisplayedMethod ------');
//     if (receivedNotification.createdLifeCycle ==
//         NotificationLifeCycle.Foreground) {
//       await displayInAppNotification(receivedNotification);
//     }
//   }

//   // Use this method to detect if the user dismissed a notification...
//   static Future<void> onDismissActionReceivedMethod(
//     ReceivedAction receivedAction,
//   ) async {
//     print('------ call onDismissActionReceivedMethod ------');
//     int notificationSubTypeId = 0;

//     Map<String, dynamic> valueMap = json.decode(
//       receivedAction.payload!['data']!,
//     );
//     Notifications notifications = Notifications.fromJson(valueMap);

//     notificationSubTypeId = NotificationUtil().getNotificationSubType(
//       valueMap['sub_type'],
//     );

//     if (receivedAction.buttonKeyPressed.isNotEmpty) {
//       // --------- Use this function for Secondry CTA action click ---------

//       NotificationUtil().handleSecondryCTAsClick(
//         notificationSubTypeId,
//         notifications.notificationData!,
//         valueMap['notification_id'],
//       );
//     }
//   }

//   // Use this method to detect when the user taps on a notification or action buttons...
//   static Future<void> onActionReceivedMethod(
//     ReceivedAction receivedAction,
//   ) async {
//     int notificationSubTypeId = 0;

//     Map<String, dynamic> valueMap = json.decode(
//       receivedAction.payload!['data']!,
//     );
//     Notifications notifications = Notifications.fromJson(valueMap);

//     notificationSubTypeId = NotificationUtil().getNotificationSubType(
//       valueMap['sub_type'],
//     );

//     print('----- sub_type: ${valueMap['sub_type']} -----');

//     // --------- Handle notification message click ---------
//     NotificationUtil().handleNotificationClick(
//       notificationSubTypeId,
//       notifications.notificationData!,
//       notification: notifications,
//     );

//     if (receivedAction.buttonKeyPressed.isNotEmpty) {
//       // For background actions, click event using action button key...

//       print('----- buttonKeyPressed: ${receivedAction.buttonKeyPressed} -----');

//       // --------- Use this function for Primary CTA action click ---------
//       NotificationUtil().handlePrimaryCTAsClick(
//         notificationSubTypeId,
//         notifications.notificationData!,
//       );
//     }
//   }

//   // // Use this method to create custom notification...

//   // static Future<void> showNotification({
//   //   required final String title,
//   //   required final String body,
//   //   final String? summary,
//   //   final Map<String, String>? payload,
//   //   final ActionType actionType = ActionType.Default,
//   //   final NotificationLayout notificationLayout = NotificationLayout.Default,
//   //   final NotificationCategory? category,
//   //   final String? bigPicture,
//   //   final String? icon,
//   //   final String? largeIcon,
//   //   final Color? backgroundColor,
//   //   final List<NotificationActionButton>? actionButtons,
//   //   final bool scheduled = false,
//   //   final int? interval,
//   // }) async {
//   //   assert(!scheduled || (scheduled && interval != null));

//   //   await AwesomeNotifications().createNotification(
//   //     content: NotificationContent(
//   //       id: -1,
//   //       channelKey: 'alert',
//   //       groupKey: 'oneplay_alert',
//   //       title: title,
//   //       body: body,
//   //       icon: icon,
//   //       largeIcon: largeIcon,
//   //       actionType: actionType,
//   //       backgroundColor: backgroundColor,
//   //       notificationLayout: notificationLayout,
//   //       summary: summary,
//   //       category: category,
//   //       payload: payload,
//   //       bigPicture: bigPicture,
//   //     ),
//   //     actionButtons: actionButtons,
//   //     schedule: scheduled
//   //         ? NotificationInterval(
//   //             interval: interval,
//   //             timeZone:
//   //                 await AwesomeNotifications().getLocalTimeZoneIdentifier(),
//   //             preciseAlarm: true,
//   //           )
//   //         : null,
//   //   );
//   // }

//   // Use this method for display in app notification...
//   static Future<void> displayInAppNotification(
//     ReceivedNotification receivedNotification,
//   ) async {
//     List<String> cTAs = [];

//     // var response = receivedNotification.payload ?? {};

//     // var createdAt =
//     //     receivedNotification.createdDate!.toUtc().millisecondsSinceEpoch;

//     // String data = response['data'] ?? '';
//     // Map<String, dynamic> valueMap = json.decode(data);

//     // print('---- displayInAppNotification -----');
//     // Notifications notificationData = Notifications.fromJson(valueMap);

//     // if (notificationData.cTAs != null && notificationData.cTAs!.isNotEmpty) {
//     //   // String jsonString = valueMap['CTAs']!; // "[\"ACCEPT\", \"REJECT\"]"
//     //   // jsonString = jsonString.replaceAll(r'\"', '"');
//     //   // cTAs = jsonDecode(jsonString).cast<String>();
//     //   cTAs.addAll(notificationData.cTAs!);
//     // }

//     //---------------
//     AnimatedSnackBar animatedSnackBar = AnimatedSnackBar(
//       builder: (context) => const SizedBox.shrink(),
//     );
//     animatedSnackBar = AnimatedSnackBar.material(
//       duration: const Duration(seconds: 5),
//       mobilePositionSettings: const MobilePositionSettings(
//         topOnAppearance: 30,
//         topOnDissapear: -200,
//       ),
//       mobileSnackBarPosition: MobileSnackBarPosition.top,
//       notifications: Notifications(
//         notificationId: "522480d0-73f3-41f5-aaab-737c0fdfb113",
//         title: "New Friend Request 🤝",
//         description:
//             "You've received a friend request from mtanna. Accept to connect and play games together!",
//         type: "friend_request",
//         subType: "FRIEND_REQUEST",
//         notificationData: NotificationData(
//           friendId: "dbc81d8e-7aa7-44a1-b45d-fff4e8651c36",
//           friendName: "mtanna",
//           friendRequestId: "bbf7984e-16ce-4f82-83da-6e3d08bdec5e",
//         ),
//         cTAs: ["ACCEPT", "REJECT"],
//         createdAt: null,
//         data: Data(),
//       ),

//       // Notifications(
//       //   notificationId: notificationData.notificationId,
//       //   title: receivedNotification.title ?? receivedNotification.body,
//       //   description:
//       //       receivedNotification.title == null ? '' : receivedNotification.body,
//       //   type: notificationData.type,
//       //   subType: notificationData.subType,
//       //   notificationData: notificationData.notificationData,
//       //   cTAs: cTAs,
//       //   createdAt: createdAt,
//       //   data: notificationData.data,
//       // ),
//       remove: () {
//         animatedSnackBar.remove();
//       },
//     );
//     animatedSnackBar.show(
//       globalNavigatorKey.currentContext!,
//     );
//   }

//   static requestNotificationPermissions() async {
//     final PermissionStatus status = await Permission.notification.request();
//     if (status.isGranted) {
//       // Notification permissions granted
//     } else if (status.isDenied) {
//       // Notification permissions denied

//       Future.delayed(const Duration(seconds: 5), () async {
//         // const AlertPermissionDialog();
//         showSnackBar(
//           globalNavigatorKey.currentContext!,
//           text: globalNavigatorKey.currentContext!.localization
//               .previouslyDeniedNotificationPermission,
//           onPressed: () async {
//             await openAppSettings();
//           },
//         );
//       });
//     } else if (status.isPermanentlyDenied) {
//       Future.delayed(const Duration(seconds: 5), () async {
//         showSnackBar(
//           globalNavigatorKey.currentContext!,
//           text: globalNavigatorKey.currentContext!.localization
//               .previouslyDeniedNotificationPermission,
//           onPressed: () async {
//             await openAppSettings();
//           },
//         );
//       });
//     }
//   }
// }

// // write(String text) async {
// //   final File file = File('/storage/emulated/0/download/my_file.txt');
// //   await file.writeAsString(text);
// // }
