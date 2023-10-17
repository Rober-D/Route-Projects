import 'package:flutter/material.dart';
import 'package:news_application/features/Home/home_screen.dart';
import 'package:news_application/provider/category_provider.dart';
import 'package:news_application/provider/language_provider.dart';
import 'package:news_application/provider/sourceModel_provider.dart';
import 'package:provider/provider.dart';
import 'core/routes/routes.dart';
import 'core/theme/theme.dart';
import 'package:flutter_locales/flutter_locales.dart';

import 'features/Splash/splash_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(["en","ar"]);
   runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: ChangeNotifierProvider<CategoryProvider>(
        create: (_) => CategoryProvider(),
        child: ChangeNotifierProvider<SourceModelProvider>(
          create: (_) => SourceModelProvider(),
          child: const NewsApp(),
        ),
      ),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) {
        return  MaterialApp(
            localizationsDelegates:Locales.delegates,
            locale:locale,
            supportedLocales: Locales.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.standardTheme,
            onGenerateRoute: Routes.generateRoute,
            home: SplashScreen(),
        );
      }
    );
  }
}
