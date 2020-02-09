import 'package:rxdart/rxdart.dart';
import '../model/weather_response_model.dart';
import 'package:weather_app_bloc/persistance/repository.dart';
import 'package:inject/inject.dart';


class WeatherBloc {
  //Repository _repository = Repository();
  Repository _repository;
  WeatherBloc(this._repository);

  final _weatherFetcher = PublishSubject<WeatherResponse>();

  Observable<WeatherResponse> get weather => _weatherFetcher.stream;

  fetchLondonWeather() async {
    WeatherResponse weatherResponse = await _repository.fetchLondonWeather();
    _weatherFetcher.sink.add(weatherResponse);
  }

  dispose() {
    _weatherFetcher.close();
  }
}

//final weatherBloc = WeatherBloc();
