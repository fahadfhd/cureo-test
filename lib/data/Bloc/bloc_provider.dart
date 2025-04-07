

import 'dart:developer';

import 'package:cureo_test/data/Bloc/bloc_event.dart';
import 'package:cureo_test/data/Bloc/bloc_state.dart';
import 'package:cureo_test/data/api_repository.dart';
import 'package:cureo_test/data/model/countries_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





class CountryBlock extends Bloc<GraphQlEvent, CountryState> {
  CountryBlock() : super(CountryInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

List<CountriesModel> listCountries = [];

    Future<void> fetchCountries() async {
       emit(CountryLoading());
         listCountries = await _apiRepository.fetchCovidList();
        // log("data ---- $mList");
        
        emit(CountryLoaded(listCountries));
    }

   
    on<GetCountries>((event, emit) async {
      try {
        emit(CountryLoading());
        final mList = await _apiRepository.fetchCovidList();
        // log("data ---- $mList");
        emit(CountryLoaded(mList));
        // if (mList.error != null) {
        //   emit(CovidError(mList.error));
        // }
      } on NetworkError {
        emit(CountryError("Failed to fetch data. is your device online?"));
      }
    });
  }
}