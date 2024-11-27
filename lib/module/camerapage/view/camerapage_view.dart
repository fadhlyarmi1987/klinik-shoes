import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:klinik_shoes_project/module/camerapage/controller/camerapage_controller.dart';

class CameraPageView extends StatelessWidget {
  final CameraPageController controller = Get.put(CameraPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAFBF9),
      appBar: AppBar(
        title: const Text('Kamera'),
        backgroundColor: const Color(0xFF29D6C8),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (controller.imagePath.isNotEmpty || controller.videoPath.isNotEmpty) {
                Get.snackbar(
                  'Success',
                  'Foto dan/atau video berhasil disimpan!',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              } else {
                Get.snackbar(
                  'Error',
                  'Tidak ada foto atau video untuk disimpan!',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Ambil Foto
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.blue),
              title: const Text('Ambil Foto'),
              onTap: controller.capturePhoto,
            ),
            Obx(() {
              if (controller.imagePath.isNotEmpty) {
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: Container(
                        constraints: const BoxConstraints(
                          maxHeight: 200, // Batas maksimal tinggi gambar
                          maxWidth: double.infinity,
                        ),
                        child: Image.file(
                          File(controller.imagePath.value),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Foto berhasil diambil!"),
                  ],
                );
              }
              return const SizedBox.shrink();
            }),
            const Divider(),

            // Ambil Video
            ListTile(
              leading: const Icon(Icons.videocam, color: Colors.green),
              title: const Text('Ambil Video'),
              onTap: controller.captureVideo,
            ),
            Obx(() {
              if (controller.videoPath.isNotEmpty &&
                  controller.videoPlayerController.value != null) {
                final videoController = controller.videoPlayerController.value!;
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: AspectRatio(
                        aspectRatio: videoController.value.aspectRatio,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: VideoPlayer(videoController),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: controller.toggleVideoPlayPause,
                          icon: Obx(() => Icon(
                              controller.isVideoPlaying.value ? Icons.pause : Icons.play_arrow)),
                          label: Obx(() => Text(
                              controller.isVideoPlaying.value ? "Pause" : "Play")),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
