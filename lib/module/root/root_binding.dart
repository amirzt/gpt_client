
import 'package:get/get.dart';
import 'package:gpt/module/root/root_controller.dart';

class RootBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(RootController());
  }

}