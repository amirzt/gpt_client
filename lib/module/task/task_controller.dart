
import 'package:get/get.dart';
import 'package:gpt/data/models/items_model.dart';
import 'package:gpt/provider/api_provider.dart';

class TaskController extends GetxController {
  var isTaskLoading = false.obs;
  var isCategoryLoading = false.obs;

  var selectedIndex = 0.obs;

  List<Category> categories = [
    Category(name: 'category', id: 1),
    Category(name: 'category', id: 1),
    Category(name: 'category', id: 1),
    Category(name: 'category', id: 1),
    Category(name: 'category', id: 1),
    Category(name: 'category', id: 1),

  ];
  List<Task> items = [
    Task(name: 'books', id: 1, icon: 'assets/icons/studying.png', description: 'Find solutions to math equations.', offline: true, script: 'script'),
    Task(name: 'books', id: 1, icon: 'assets/icons/studying.png', description: 'Find solutions to math equations.', offline: true, script: 'script'),
    Task(name: 'books', id: 1, icon: 'assets/icons/studying.png', description: 'Find solutions to math equations.', offline: true, script: 'script'),
    Task(name: 'books', id: 1, icon: 'assets/icons/studying.png', description: 'Find solutions to math equations.', offline: true, script: 'script'),
    Task(name: 'books', id: 1, icon: 'assets/icons/studying.png', description: 'Find solutions to math equations.', offline: true, script: 'script'),
    Task(name: 'books', id: 1, icon: 'assets/icons/studying.png', description: 'Find solutions to math equations.', offline: true, script: 'script'),
    Task(name: 'books', id: 1, icon: 'assets/icons/studying.png', description: 'Find solutions to math equations.', offline: true, script: 'script'),

  ];

  getCategories() async{
    isCategoryLoading.value = true;
    categories = await ApiProvider().getCategories();
    isCategoryLoading.value = false;
  }

  getItems() async{
    isTaskLoading.value = true;
    items = await ApiProvider().getItems(categories[selectedIndex.value].id);
    isTaskLoading.value = false;
  }
}