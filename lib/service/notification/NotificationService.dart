import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart' as getX;
import 'package:flutter/material.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService() {
    final initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> init() async {
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Pengguna memberikan izin");

      String? token = await _firebaseMessaging.getToken();
      print("Device Token: $token");

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (message.notification != null) {
          print(
              "Pesan diterima di latar depan: ${message.notification?.title}");
          getX.Get.snackbar(
            message.notification?.title ?? "Notifikasi",
            message.notification?.body ?? "",
            snackPosition: getX.SnackPosition.TOP,
            margin: EdgeInsets.all(16),
          );
        }
      });
    } else {
      print("Pengguna menolak izin");
    }

    // Tangani saat aplikasi berada di latar belakang atau sudah ditutup
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      final prefs = await SharedPreferences.getInstance();
      bool? isLoggedIn = prefs.getBool('isLoggedIn');

      if (isLoggedIn ?? false) {
        getX.Get.offAllNamed('/home');
      } else {
        getX.Get.offAllNamed('/login');
      }
    });
  }

  Future<void> showDelayedNotification() async {
    await Future.delayed(Duration(seconds: 2));

    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'description',
      importance: Importance.max,
      priority: Priority.high,
    );
    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Belum Checkout?',
      'Ayo segera checkout biar sepatu kamu makin kinclong',
      notificationDetails,
    );
  }
}
