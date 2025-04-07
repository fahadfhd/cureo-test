import 'package:cureo_test/data/model/countries_model.dart';
import 'package:cureo_test/domain/api_service.dart';

class ApiRepository {
  final _provider = ApiService();

  Future<List<CountriesModel>> fetchCovidList() {
    return _provider.getGraphURL();
  }
}

class NetworkError extends Error {}