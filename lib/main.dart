import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:client_user/screen/signPage/loginScreen.dart';
import 'package:client_user/screen/signPage/signUpScreen.dart';
import 'package:client_user/screen/homePage/HomePage.dart';
import 'package:get/get.dart';

import 'getX/fcm/notification_controller.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  AwesomeNotifications().createNotificationFromJsonData(message.data);

  AwesomeNotifications().createNotification(
      content: NotificationContent(
    id: 1,
    channelKey: 'high_importance_channel',
    title: message.notification?.title,
    body: message.notification?.body,
    bigPicture: message.notification.android.imageUrl,
    notificationLayout: NotificationLayout.BigPicture,
    displayOnBackground: true,
    displayOnForeground: true,
    largeIcon: message.notification.android.imageUrl,
  ));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
          channelKey: 'high_importance_channel',
          channelName: 'High Importance notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white,
          playSound: true,
          enableLights: true,
          enableVibration: true,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
        ),
      ]);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // Insert here your friendly dialog box before call the request method
      // This is very important to not harm the user experience
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  AwesomeNotifications().actionStream.listen((receivedNotification) {});

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '모닥모닥',
      debugShowCheckedModeBanner: false, //debug ribbon remove
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/signIn', page: () => SignUpScreen()),
        GetPage(name: '/homPage', page: () => HomePage()),
        //GetPage(name: '/homPage', page: () => HomePage()),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
