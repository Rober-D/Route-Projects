import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_locales/flutter_locales.dart';
import '../../core/Custome Widgets/language_droplist.dart';
import '../../core/shared_wigets/drawer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static const String routeName = "Settings";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
            title: const LocaleText(
              "Settings",
              style: TextStyle(fontSize: 28),
            ),
          ),
        ),
        drawer: const ScreenDrawer(),
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: LocaleText(
                "language",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const LanguageDropList(),
          ],
        ),
      ),
    );
  }
}
