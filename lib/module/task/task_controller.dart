
import 'package:get/get.dart';
import 'package:gpt/data/models/items_model.dart';
import 'package:gpt/provider/api_provider.dart';

class TaskController extends GetxController {
  var isTaskLoading = false.obs;
  var isCategoryLoading = false.obs;

  var selectedIndex = 0.obs;

  List<Category> categories = [];
  List<Task> items = [];

  @override
  onInit(){
    super.onInit();
    getCategories();
  }

  getCategories() async{
    isCategoryLoading.value = true;
    categories = await ApiProvider().getCategories();
    isCategoryLoading.value = false;
    getItems();
  }

  getItems() async{
    isTaskLoading.value = true;
    items = await ApiProvider().getItems(categories[selectedIndex.value].id);
    isTaskLoading.value = false;
  }
}