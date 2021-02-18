import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/pages/home/home_page.dart';
import 'package:getx_app/pages/ocr_details/ocr_details_controller.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'dart:io';



class OCRDetailsPage extends GetView<OCRDetailsController>{

  var text="";
  bool _imageLoaded = false;
  //File _pickedImage=null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 100.0),
          _imageLoaded
              ? Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(blurRadius: 20),
                  ],
                ),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                height: 250,
                child: Image.file(
                  controller.image,
                  fit: BoxFit.cover,
                ),
              ))
              : Container(),
          SizedBox(height: 10.0),
          text == ''
              ? Text('Text will display here')
              :  Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  text,
                ),
              ),
            ),
          ),
          RaisedButton(
            child: const Text('Save', style: TextStyle(fontSize: 20)),
            onPressed: () => Get.to(HomePage())
            ,)
        ],
      ),
    );
  }

  Future OCRImage(File Image)async{
    //await Future.delayed(Duration(seconds: 5));
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
  }

}
