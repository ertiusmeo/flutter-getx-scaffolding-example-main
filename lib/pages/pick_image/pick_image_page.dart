import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/pages/pick_image/pick_image_controller.dart';
import 'package:getx_app/routes/app_routes.dart';
import 'package:image_picker/image_picker.dart';

class PickImagePage extends GetView<PickImageController>{


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
              //if (controller.image != null) ...[
              Container(
                  padding: EdgeInsets.all(32),
                  child:  GetBuilder<PickImageController>(
                    builder: (_) {
                      return controller.image != null
                          ? Image.file(controller.image)
                          : Container();
                    },
                  ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    color: Colors.blue,
                    child: Icon(Icons.crop),
                    onPressed: ()  =>  controller.cropImage(),
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
                            arguments: {'image': controller.image, 'file_loaded':controller.fileLoaded},
                          )
                    ),
                  ],
                ),
              ]//]
          ),
          );
      }



  void _clear() {
    //setState(() => _imageFile = null);
  }

}

