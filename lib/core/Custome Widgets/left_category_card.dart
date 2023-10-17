import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:news_application/core/constants/colors_const.dart';
import 'package:news_application/features/Category/category_screen.dart';
import 'package:provider/provider.dart';
import '../../model/models.dart';
import '../../provider/category_provider.dart';
import '../../provider/sourceModel_provider.dart';

class LeftCategoryCard extends StatelessWidget {
  const LeftCategoryCard({super.key, required this.selectedCategory});

  final Categories? selectedCategory;

  @override
  Widget build(BuildContext context) {

    CategoryProvider category = Provider.of<CategoryProvider>(context);
    return GestureDetector(
      child: Container(
        height: 180,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(26),
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
          ),
          color: selectedCategory?.catColor ?? ColorsConstants.primeGreen,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image(
              image: AssetImage(selectedCategory!.catImage),
              height: 120,
            ),
            Expanded(
              child: LocaleText(
                selectedCategory!.catName,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        category.selectCategory(selectedCategory!);
        print(selectedCategory?.catName);
        Navigator.pushNamed(context, CategoryScreen.routeName);
      },
    );
  }
}
