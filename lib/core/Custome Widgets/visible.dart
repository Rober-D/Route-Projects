import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import '../../provider/category_provider.dart';

class Visible extends StatelessWidget {
  Visible({super.key,required this.visible});
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    CategoryProvider category = Provider.of<CategoryProvider>(context);

    return Visibility(
      visible: visible,
      child: LocaleText(
        category.selectedCategory!.catName,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
