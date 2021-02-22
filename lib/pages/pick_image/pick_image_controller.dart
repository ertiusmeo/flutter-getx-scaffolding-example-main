import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';


class PickImageController extends GetxController {

  File image;
  final picker = ImagePicker();
  var text="";
  bool fileLoaded=false;


  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      fileLoaded=true;
    } else {
      print('No image selected.');
    }
    update();
  }

  Future<void> cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: image.path,
        // ratioX: 1.0,
        // ratioY: 1.0,
        // maxWidth: 512,
        // maxHeight: 512,
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
        toolbarTitle: 'Crop It');

    image = cropped ?? image;
    update();
  }

 /*Future OCRImage(File Image)async{
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(Image);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await textRecognizer.processImage(visionImage);

    for (TextBlock block in visionText.blocks) {

      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {

          text = text + word.text + ' ';

        }
        text = text + '\n';
      }
    }
    textRecognizer.close();
    //return text;
  }
*/

}
