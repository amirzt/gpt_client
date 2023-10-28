
import 'package:get/get.dart';

class FirstInitialBindings extends Bindings{


  @override
  void dependencies() {
    Get.put(FirstInitialBindings());
  }

}