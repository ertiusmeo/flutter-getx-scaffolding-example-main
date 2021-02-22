import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/pages/ocr_details/ocr_details_controller.dart';
import 'package:getx_app/routes/app_routes.dart';



class OCRDetailsPage extends GetView<OCRDetailsController>{


  @override
  Widget build(BuildContext context) {
       controller.OCRImage();

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 100.0),
          controller.file_loaded
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
          controller.text == ''
              ? Text('Text will display here')
              :  Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  controller.text,
                ),
              ),
            ),
          ),
          RaisedButton(
            child: const Text('Save', style: TextStyle(fontSize: 20)),
            onPressed: () => Get.toNamed(
              AppRoutes.HOME,
              //arguments: {'image': controller.image, 'ocr_text': controller.ocr_text},
            )
            ,)
        ],
      ),
    );
  }



}
