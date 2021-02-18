import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/pages/home/home_controller.dart';
import 'package:getx_app/pages/pick_image/pick_image_page.dart';
import 'package:getx_app/routes/app_routes.dart';

class HomePage extends GetView<HomeController> {


  final myController1 = TextEditingController();
  final myController2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grobonet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            children: <Widget>[
              TextField(
                controller: myController1,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nazwisko'),

              ),
              TextField(
                controller: myController2,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Miejscowosc'),

              ),
              IconButton(
                icon: Icon(
                  Icons.save_outlined,
                  size: 30,
                ),
                onPressed: () => Get.toNamed(
                  AppRoutes.PICK_IMAGE
                ),
                color: Colors.pink,
              ),
              /*if (_pickedImage != null) ...[
                Container(
                    padding: EdgeInsets.all(32), child: Image.file(_pickedImage)),
              ],*/
            ]
        ),
      ),

    );
  }
}
