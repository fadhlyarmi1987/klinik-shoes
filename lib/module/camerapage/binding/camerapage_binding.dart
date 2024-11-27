import 'package:get/get.dart';
import 'package:klinik_shoes_project/module/camerapage/controller/camerapage_controller.dart';

class CameraPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CameraPageController>(() => CameraPageController());
  }
}