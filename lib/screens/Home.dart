
import 'package:custom_painting/controllers/clock_controller.dart';
import 'package:custom_painting/widgets/BasicShapes.dart';
import 'package:custom_painting/widgets/SpacyBottomNaviagtionBar.dart';
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
              InkWell(
                onTap: (){
                  Get.to(()=> SpacyBottomNavigationBar());
                },
                child: Container(
                  height: 70,
                  margin: EdgeInsets.all(20),
                  color: Colors.red.shade50,
                  child: const Center(child: Text('Spacy Bottom Navigation Bar')),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(()=> BasicShapes());
                },
                child: Container(
                  height: 70,
                  margin: const EdgeInsets.all(20),
                  color: Colors.red.shade50,
                  child: const Center(child: Text('Basic Shapes')),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}