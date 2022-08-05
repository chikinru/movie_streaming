import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming/controllers/animebindingcontroller.dart';

import 'screens/homescreen.dart';

void main() {
  runApp(GetMaterialApp(
    initialBinding: AnimeBindingController(),
    home: HomeScreen(),
  ));
}
