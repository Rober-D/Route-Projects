import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../core/shared_wigets/drawer.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  static const String routeName = "Article";

  @override
  Widget build(BuildContext context) {
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
              Locales.string(context, "articles"),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        drawer: const ScreenDrawer(),
        body: ListView(
          children: [

          ],
        ),
      ),
    );
  }
}
