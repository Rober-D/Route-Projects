import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_application/model/models.dart';
import 'package:news_application/network/api_manager.dart';

class SourceModelProvider extends ChangeNotifier{

  SourceModel? sourceModel;
  List<Source>? displaySearch;
  bool loading = true;

  void getSourceModel(String category) async{
    Response response = await ApiManager.getData(category);
    sourceModel = SourceModel.fromJson(response.data);
    //notifyListeners();

      displaySearch = List.from(sourceModel!.sources);
      loading = false;
      notifyListeners();
  }

  void searchForArticle(String value) {

    displaySearch = sourceModel!.sources
        .where((element) =>
        element.description.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }
}