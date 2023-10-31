
import 'package:get/get.dart';
import 'package:gpt/core/urls.dart';
import 'package:gpt/data/models/items_model.dart';
import 'package:gpt/data/models/plan_model.dart';
import 'package:gpt/provider/api_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeController extends GetxController {
  Plan plan = Plan(title: '', price: '0', id: 0, checked: false);

  @override
  onInit(){
    super.onInit();
    getSpecialPlan();
  }

  List<Task> recommended = [
    Task(name: 'how to be rich and make money?  ', id: 1, icon: 'assets/icons/money.png', description: 'description', offline: true, script: 'how can i become rich? give me a short answer', firstSend: true),
    Task(name: 'how to be rich and make money? ', id: 1, icon: 'assets/icons/money.png', description: 'description', offline: true, script: 'how can i become rich? give me a short answer', firstSend: true),
    Task(name: 'how to be rich and make money? ', id: 1, icon: 'assets/icons/money.png', description: 'description', offline: true, script: 'how can i become rich? give me a short answer', firstSend: true),
    Task(name: 'how to be rich and make money? ', id: 1, icon: 'assets/icons/money.png', description: 'description', offline: true, script: 'how can i become rich? give me a short answer', firstSend: true),
    Task(name: 'how to be rich and make money? ', id: 1, icon: 'assets/icons/money.png', description: 'description', offline: true, script: 'how can i become rich? give me a short answer', firstSend: true),
    Task(name: 'how to be rich and make money? ', id: 1, icon: 'assets/icons/money.png', description: 'description', offline: true, script: 'how can i become rich? give me a short answer', firstSend: true),
  ];

  getSpecialPlan() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    plan = await ApiProvider()
        .getSpecialPlans(GlobalURL.getZarinpalPlan,
        {
          'is_special': '1',
          'package_name': packageName
        }
    );
  }

}