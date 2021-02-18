import 'package:get/get.dart';
import 'package:getx_app/pages/home/home_binding.dart';
import 'package:getx_app/pages/home/home_page.dart';
import 'package:getx_app/pages/ocr_details/ocr_details_binding.dart';
import 'package:getx_app/pages/ocr_details/ocr_details_page.dart';
import 'package:getx_app/pages/pick_image/pick_image_binding.dart';
import 'package:getx_app/pages/pick_image/pick_image_page.dart';
import 'package:getx_app/routes/app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.PICK_IMAGE,
      page: () => PickImagePage(),
      binding: PickImageBinding(),
    ),
    GetPage(
      name: AppRoutes.OCR_DETAILS,
      page: () => OCRDetailsPage(),
      binding: OCRDetailsBinding(),
    )
  ];
}
