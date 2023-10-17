import 'package:flutter/material.dart';

class AppTheme{

  static ThemeData standardTheme = ThemeData(
    appBarTheme: const AppBarTheme(centerTitle: true,
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      iconTheme: IconThemeData(
        size: 30,
        color: Colors.white,
      )
    ),
  );
}