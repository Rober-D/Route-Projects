import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{

  String selectedLanguage = "English";
  String localeLanguage = "en";

  String selectedAppLanguage(String selectedLang){
    if(selectedLang == "English"){
      localeLanguage = "en";
      return localeLanguage;
    }else if(selectedLang == "Arabic"){
      localeLanguage = "ar";
      return localeLanguage;
    }else{
      localeLanguage = "en";
      return localeLanguage;
    }
  }
}