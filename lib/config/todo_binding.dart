import 'package:get/get.dart';

import '../controllers/controller.dart';

class TodoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SQLController>(() => SQLController());
  }
}