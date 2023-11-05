import 'package:get/get.dart';
import 'package:pizza_app/pages/root/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
  }
}
