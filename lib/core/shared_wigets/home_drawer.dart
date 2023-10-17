import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../features/settings/settings_screen.dart';
// import '../../generated/l10n.dart';
import '../constants/colors_const.dart';
import 'package:flutter_locales/flutter_locales.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
             DrawerHeader(
              decoration: const BoxDecoration(
                color: ColorsConstants.primeGreen,
              ),
              child: Center(
                child: Text(
                  Locales.string(context, "title"),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            InkWell(
              child: Row(
                children: [
                  const SizedBox(width: 10,),
                  const Icon(
                    Icons.menu,
                    size: 25,
                    weight: 1,
                  ),
                  const SizedBox(width: 15,),
                  Text(
                    Locales.string(context, "categories"),
                    style: GoogleFonts.calistoga(color: Colors.black,fontSize: 25),
                  ),
                ],
              ),
              onTap: (){Navigator.pop(context);},
            ),
            const SizedBox(height: 15,),
            InkWell(
              child: Row(
                children: [
                  const SizedBox(width: 10,),
                  const Icon(
                    Icons.settings,
                    size: 25,
                    weight: 1,
                  ),
                  const SizedBox(width: 15,),
                  Text(
                    Locales.string(context, "settings"),
                    style: GoogleFonts.calistoga(color: Colors.black,fontSize: 25),
                  ),
                ],
              ),
              onTap: (){Navigator.pushNamed(context,SettingsScreen.routeName);},
            ),
          ],
        ));
  }
}
