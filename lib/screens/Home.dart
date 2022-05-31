
import 'package:custom_painting/controllers/clock_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/CircularProgressBar1View.dart';
import '../widgets/Clock1View.dart';

class Home extends StatelessWidget{
  ClockController clockController = Get.put(ClockController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF2E0249),
      body: Center(
        child: Container(
          child: ListView(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              Center(child: Container(
                color: Colors.grey.shade700,
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(20),
                  child: Clock1View(120.0, 120.0))),
              // Center(child: Container(
              //     color: Colors.grey.shade700,
              //     margin: EdgeInsets.all(30),
              //     padding: EdgeInsets.all(20),
              //     child: Column(
              //       children: [
              //         ElevatedButton(onPressed: (){
              //           clockController.progress.value < 100.0 ? clockController.incrementProgress(): clockController.resetProgress();
              //         }, child: Text('++')),
              //         Obx(()=>CircularProgressBar1View(clockController.progress.value)),
              //       ],
              //     ))),
            ],
          )
        ),
      ),
    );
  }
}