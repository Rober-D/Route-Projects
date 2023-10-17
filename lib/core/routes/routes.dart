import 'package:flutter/material.dart';
import 'package:news_application/features/Home/home_screen.dart';
import 'package:news_application/features/settings/settings_screen.dart';
import '../../features/Article/article_screen.dart';
import '../../features/Category/category_screen.dart';
import '../../features/Splash/splash_screen.dart';

class Routes{

  static Route<dynamic> generateRoute (RouteSettings settings){
    switch (settings.name){
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (context)=> SplashScreen(), settings: settings);
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context)=> const HomeScreen(), settings: settings);
      case CategoryScreen.routeName:
        return MaterialPageRoute(builder: (context)=> const CategoryScreen(), settings: settings);
      case SettingsScreen.routeName:
        return MaterialPageRoute(builder: (context)=> const SettingsScreen(), settings: settings);
        case ArticleScreen.routeName:
        return MaterialPageRoute(builder: (context)=> const ArticleScreen(), settings: settings);
      default:
        return MaterialPageRoute(builder: (context)=>  const HomeScreen(), settings: settings);
    }
  }
}