import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Behaviour/Core/Resources/colors_manager.dart';
import 'package:weather_app/Behaviour/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Behaviour/cubites/get_weather_cubit/weather_cubit_states.dart';
import 'package:weather_app/Presentation/Themes/theme.dart';
import 'package:weather_app/Presentation/views/home_view.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const CustomMaterialApp(),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        String? weatherState = BlocProvider.of<GetWeatherCubit>(context)
            .cityWeatherData
            ?.weatherStatus;
        List<Color> colorGradiant = [];
        if (weatherState == null) {
          colorGradiant.add(ColorsManager.white);
          colorGradiant.add(ColorsManager.white);
        } else if (weatherState.contains("Sunny")) {
          colorGradiant.add(ColorsManager.orange);
          colorGradiant.add(const Color.fromARGB(255, 242, 222, 38));
          colorGradiant.add(const Color.fromARGB(255, 244, 228, 89));
        } else {
          colorGradiant.add(ColorsManager.blue);
          colorGradiant.add(Colors.lightBlue);
          colorGradiant.add(Colors.lightBlueAccent);
        }
        return MaterialApp(
          theme: weatherState == null
              ? Themes.light
              : weatherState.contains("Sunny")
                  ? Themes.sunny
                  : Themes.rainy,
          debugShowCheckedModeBanner: false,
          home: HomeView(
            colorGradiant: colorGradiant,
          ),
        );
      },
    );
  }
}
