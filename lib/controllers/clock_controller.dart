import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class ClockController extends GetxController{
  var dateTime = DateTime.now().obs;
  var progress = 0.0.obs;

  void incrementProgress(){
    progress.value += 5;
  }

  void resetProgress(){
    progress.value = 5.0;
  }
}