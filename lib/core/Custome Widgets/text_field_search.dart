import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/sourceModel_provider.dart';
import '../constants/colors_const.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    SourceModelProvider sourceModel = Provider.of<SourceModelProvider>(context);
    return TextField(
      onChanged: (value) {
        sourceModel.searchForArticle(value);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Search article",
        hintStyle: const TextStyle(
          color: ColorsConstants.primeGreen,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1, color: ColorsConstants.primeGreen),
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
