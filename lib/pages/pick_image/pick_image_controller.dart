import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PickImageController extends GetxController {
  //File image = Get.arguments['image'];

  File image;
  final picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    update();
  }

}
