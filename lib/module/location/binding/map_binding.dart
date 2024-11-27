import 'package:get/get.dart';
import 'package:klinik_shoes_project/module/location/controller/map_controller.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(
      () => MapController(),
    );
  }
}
