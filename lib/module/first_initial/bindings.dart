
import 'package:get/get.dart';
import 'package:gpt/module/first_initial/first_initial_controller.dart';

class FirstInitialBindings extends Bindings{


  @override
  void dependencies() {
    Get.put(FirstInitialController());
  }

}