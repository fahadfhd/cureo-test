import 'package:cureo_test/data/model/countries_model.dart';
import 'package:equatable/equatable.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object?> get props => [];
}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<CountriesModel> countryModel;
  const CountryLoaded(this.countryModel);

  @override
  List<Object?> get props => [countryModel];
}

class CountryError extends CountryState {
  final String? message;
  const CountryError(this.message);
}