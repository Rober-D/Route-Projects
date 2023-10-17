import 'package:flutter/foundation.dart';
import '../core/constants/api_const.dart';
import '../core/constants/colors_const.dart';
import '../core/constants/image_const.dart';
import '../model/models.dart';

class CategoryProvider extends ChangeNotifier{

  Categories? selectedCategory;

  void selectCategory (Categories category) {
    category.selected = true;
    selectedCategory = category;
  }
}