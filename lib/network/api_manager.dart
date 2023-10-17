import 'package:dio/dio.dart';
import '../core/constants/api_const.dart';

class ApiManager{
  
  static Future<Response> getData(String category) async{

       Response response = await Dio().get("${ApiConstants.url}?apiKey=${ApiConstants.apiKey}&category=$category");
       //SourceModel sourceData = SourceModel.fromJson(response.data);

       if(response.statusCode == 200){
         return response;
       }
       return response;
  }
}