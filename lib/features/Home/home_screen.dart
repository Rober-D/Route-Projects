import 'package:flutter/material.dart';

import '../../core/Custome Widgets/left_category_card.dart';
import '../../core/Custome Widgets/right_category_card.dart';
import '../../core/constants/api_const.dart';
import '../../core/constants/colors_const.dart';
import '../../core/constants/image_const.dart';
import '../../core/shared_wigets/home_drawer.dart';
import '../../model/models.dart';
import 'package:flutter_locales/flutter_locales.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Categories? sportsCategory = Categories(
        catName: CategoryConstants.sports,
        catColor: ColorsConstants.sportsCard,
        catImage: ImagesConstants.sportsImg);
    Categories? politicsCategory = Categories(
        catName: CategoryConstants.general,
        catColor: ColorsConstants.politicsCard,
        catImage: ImagesConstants.politicsImg);
    Categories? healthCategory = Categories(
        catName: CategoryConstants.health,
        catColor: ColorsConstants.healthCard,
        catImage: ImagesConstants.healthImg);
    Categories? businessCategory = Categories(
        catName: CategoryConstants.business,
        catColor: ColorsConstants.businessCard,
        catImage: ImagesConstants.businessImg);
    Categories? scienceCategory = Categories(
        catName: CategoryConstants.science,
        catColor: ColorsConstants.scienceCard,
        catImage: ImagesConstants.scienceImg);
    Categories? environmentCategory = Categories(
        catName: CategoryConstants.entertainment,
        catColor: ColorsConstants.environmentCard,
        catImage: ImagesConstants.environmentImg);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/pattern.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            title: Text(
              Locales.string(context, "title"),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        drawer: const HomeDrawer(),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Locales.string(context, "pick_category"),
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Expanded(
                    child: LeftCategoryCard(selectedCategory: sportsCategory),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child:
                        RightCategoryCard(selectedCategory: politicsCategory),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: LeftCategoryCard(selectedCategory: healthCategory),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child:
                        RightCategoryCard(selectedCategory: businessCategory),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child:
                        LeftCategoryCard(selectedCategory: environmentCategory),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: RightCategoryCard(selectedCategory: scienceCategory),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
