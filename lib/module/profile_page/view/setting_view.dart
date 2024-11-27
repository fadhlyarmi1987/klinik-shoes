import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../controller/settings_controller.dart';
import 'package:klinik_shoes_project/model/speaker/audio_notification_model.dart';
import 'package:klinik_shoes_project/module/welcome_page/view/welcome_page_view.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final SettingsController controller;
  late final AudioNotificationModel model;

  @override
  void initState() {
    super.initState();
    model = AudioNotificationModel();
    controller = SettingsController(model);
  }

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => WelcomePage()); // Navigasi ke halaman landing page setelah logout
    } catch (e) {
      Get.snackbar('Logout Failed', 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xFF29D6C8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: _logout,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications_active, color: Colors.blue),
              title: const Text('Audio Notification'),
              trailing: Switch(
                value: model.isAudioNotificationEnabled,
                onChanged: (value) {
                  setState(() {
                    controller.toggleAudioNotification();
                  });
                  if (value) {
                    controller.playNotificationSound();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
