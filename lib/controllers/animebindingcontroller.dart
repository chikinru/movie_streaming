import 'package:get/get.dart';

import 'animecontroller.dart';

class AnimeBindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnimeController());
  }
}
