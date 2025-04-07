import 'package:cureo_test/data/model/countries_model.dart';
import 'package:equatable/equatable.dart';


class GraphQlEvent extends Equatable {
  @override
  List<Object> get props => [];
   

   
}

class GetCountries extends GraphQlEvent {
  List<CountriesModel>? countries;

  GetCountries({
     this.countries,
  });
}



class SearchCountries extends GraphQlEvent {
  String? serached;

  SearchCountries({
     this.serached,
  });
}


