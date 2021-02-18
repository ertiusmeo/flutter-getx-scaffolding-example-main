import 'package:get/get.dart';
import 'package:getx_app/pages/ocr_details/ocr_details_controller.dart';

class OCRDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OCRDetailsController>(() => OCRDetailsController());
  }
}
