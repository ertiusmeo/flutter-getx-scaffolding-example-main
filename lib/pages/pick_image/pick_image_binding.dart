import 'package:get/get.dart';
import 'package:getx_app/pages/pick_image/pick_image_controller.dart';

class PickImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickImageController>(() => PickImageController(), fenix: true);
  }
}
