import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/pages/pick_image/pick_image_controller.dart';
import 'package:getx_app/routes/app_routes.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class PickImagePage extends StatelessWidget{

  //var _imageFile;
  //var text="";
  final controller = Get.find<PickImageController>();

  @override
  Widget build(BuildContext context) {

        return Scaffold(

          bottomNavigationBar: BottomAppBar(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.photo_camera,
                    size: 30,
                  ),
                  onPressed: () => controller.getImage(ImageSource.camera),
                  color: Colors.blue,
                ),
                IconButton(
                  icon: Icon(
                    Icons.photo_library,
                    size: 30,
                  ),
                  onPressed: () =>  controller.getImage(ImageSource.gallery),
                  color: Colors.pink,
                ),
              ],
            ),
          ),
          body: ListView(
            children: <Widget>[
              if (controller.image != null) ...[
                Container(
                    padding: EdgeInsets.all(32),
                    child: Image.file(controller.image)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      color: Colors.blue,
                      child: Icon(Icons.crop),
                      //onPressed: _cropImage,
                    ),
                    FlatButton(
                      color: Colors.blue,
                      child: Icon(Icons.refresh),
                      onPressed: _clear,
                    ),
                    FlatButton(
                      color: Colors.blue,
                      child: Icon(Icons.arrow_forward_ios),
                      onPressed: () =>
                          Get.toNamed(
                            AppRoutes.OCR_DETAILS,
                            //arguments: {'image': _imageFile},
                          ),
                    ),
                  ],
                ),
              ]
            ],
          )
        );
      }
/*
  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        // ratioX: 1.0,
        // ratioY: 1.0,
        // maxWidth: 512,
        // maxHeight: 512,
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
        toolbarTitle: 'Crop It');

    //setState(() {
      _imageFile = cropped ?? _imageFile;
    //});
  }
*/

  void _clear() {
    //setState(() => _imageFile = null);
  }

}

