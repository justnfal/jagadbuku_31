import 'package:get/get.dart';

class SearchController extends GetxController {
  final searchText = ''.obs;

  void setSearchText(String text) {
    searchText.value = text;
  }
}
