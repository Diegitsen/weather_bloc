import 'package:inject/inject.dart';
import '../model/weather_response_model.dart';
import 'api_provider.dart';

@provide
@singleton
class Repository {
  //ApiProvider appApiProvider = ApiProvider();

  ApiProvider apiProvider;
  Repository(this.apiProvider);

  Future<WeatherResponse> fetchLondonWeather() => apiProvider.fetchLondonWeather();
}

