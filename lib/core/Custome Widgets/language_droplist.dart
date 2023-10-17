import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';

import '../../provider/language_provider.dart';
import '../constants/colors_const.dart';

class LanguageDropList extends StatefulWidget {
  const LanguageDropList({super.key});

  @override
  State<LanguageDropList> createState() => _LanguageDropListState();
}

class _LanguageDropListState extends State<LanguageDropList> {
  @override
  Widget build(BuildContext context) {
    LanguageProvider language = Provider.of<LanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: DropdownButtonFormField<String>(
        value: Locales.currentLocale(context).toString() == "en"
            ? "English"
            : "Arabic",
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorsConstants.primeGreen,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ColorsConstants.primeGreen),
          ),
          focusColor: ColorsConstants.primeGreen,
          filled: true,
          fillColor: Colors.white,
        ),
        items: <String>["English", "Arabic"]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value!,
              style: const TextStyle(
                fontSize: 20,
                color: ColorsConstants.primeGreen,
              ),
            ),
          );
        }).toList(),
        onChanged: (Object? newValue) {
          setState(() {
            language.selectedLanguage = newValue.toString();
            LocaleNotifier.of(context)
                ?.change(language.selectedAppLanguage(newValue.toString()));
          });
          print(language.selectedLanguage);
        },
      ),
    );
  }
}
