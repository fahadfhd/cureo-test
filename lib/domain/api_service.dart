import 'dart:convert';
import 'dart:developer';

import 'package:cureo_test/data/Bloc/bloc_state.dart';
import 'package:cureo_test/data/model/countries_model.dart';
import 'package:cureo_test/domain/urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiService {
  final dio = Dio();

  Future<List<CountriesModel>>getGraphURL()async{
    try{
       final response = await dio.post(
        ApiConstants.baseURL,
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (_) => true,
        ),
        data: {
          "query": """
            query {
              countries {
                code
                name
                emoji
              }
            }
          """
        },
      );

// log("response ===== ${response.data.toString()}");
      

      
     return (response.data["data"]["countries"] as List).map((e) => CountriesModel.fromJson(e)).toList();

    
  }on DioException catch (error, stackTrace) {
    if(error.type == DioExceptionType.connectionError){
      log("Connection Error: ${error.message}");
      CountryError("Network Error");
      return [];
    }
      return [];
  }
  
  }
  
}
