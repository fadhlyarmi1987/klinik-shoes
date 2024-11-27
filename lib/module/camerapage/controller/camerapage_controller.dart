import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CameraPageController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  
  var imagePath = ''.obs; // Path untuk gambar yang diambil
  var videoPath = ''.obs; // Path untuk video yang diambil
  var isImageLoading = false.obs; // Status loading saat mengambil gambar
  var isVideoLoading = false.obs; // Status loading saat mengambil video
  var isVideoPlaying = false.obs; // Status pemutaran video
  var isVideoInitialized = false.obs; // Status inisialisasi video

  var videoPlayerController = Rx<VideoPlayerController?>(null); // Controller untuk video player

  @override
  void onInit() {
    super.onInit();
    // Listener untuk mendeteksi perubahan pada videoPlayerController
    ever(videoPlayerController, (VideoPlayerController? controller) {
      if (controller != null) {
        controller.addListener(() {
          // Update status pemutaran video
          isVideoPlaying.value = controller.value.isPlaying;
        });
      }
    });
  }

  @override
  void onClose() {
    videoPlayerController.value?.dispose();
    super.onClose();
  }

  // Fungsi untuk mengambil gambar
  Future<void> capturePhoto() async {
    try {
      isImageLoading.value = true;
      final XFile? pickedImage = await _picker.pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        imagePath.value = pickedImage.path;
      } else {
        print("No image captured.");
      }
    } catch (e) {
      print("Error capturing image: $e");
    } finally {
      isImageLoading.value = false;
    }
  }

  // Fungsi untuk mengambil video
  Future<void> captureVideo() async {
    try {
      isVideoLoading.value = true;
      final XFile? pickedVideo = await _picker.pickVideo(source: ImageSource.camera);
      if (pickedVideo != null) {
        videoPath.value = pickedVideo.path;
        print("Video path: ${videoPath.value}");

        // Inisialisasi VideoPlayerController dengan video yang direkam
        final controller = VideoPlayerController.file(File(videoPath.value));
        videoPlayerController.value = controller;

        await controller.initialize();
        print("Video initialized: ${controller.value.isInitialized}");
        isVideoInitialized.value = true;
      } else {
        print("No video captured.");
      }
    } catch (e) {
      print("Error capturing video: $e");
    } finally {
      isVideoLoading.value = false;
    }
  }

  // Fungsi untuk memutar video
  void playVideo() {
    if (videoPlayerController.value != null && videoPlayerController.value!.value.isInitialized) {
      videoPlayerController.value!.play();
      isVideoPlaying.value = true;
    }
  }

  // Fungsi untuk menjeda video
  void pauseVideo() {
    if (videoPlayerController.value != null && videoPlayerController.value!.value.isInitialized) {
      videoPlayerController.value!.pause();
      isVideoPlaying.value = false;
    }
  }

  // Fungsi untuk toggle play/pause video
  void toggleVideoPlayPause() {
    if (videoPlayerController.value != null && videoPlayerController.value!.value.isInitialized) {
      if (videoPlayerController.value!.value.isPlaying) {
        pauseVideo();
      } else {
        playVideo();
      }
    }
  }
}
