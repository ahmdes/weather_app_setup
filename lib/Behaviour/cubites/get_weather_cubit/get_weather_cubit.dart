import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Behaviour/cubites/get_weather_cubit/weather_cubit_states.dart';

import '../../Models/city.dart';
import '../../services/cites_data.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  City? cityWeatherData;
  // ThemeData themeData = Themes.light;
  GetWeatherCubit() : super(NoWeatherData());
  getWeather({required String cityName}) async {
    try {
      cityWeatherData = await CitesData().getCitesData(cityName);
      emit(ShowWeatherData());
    } catch (e) {
      emit(ErrorGettingWeatherData());
    }
  }
}
