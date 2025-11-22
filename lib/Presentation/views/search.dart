import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Behaviour/cubites/get_weather_cubit/get_weather_cubit.dart';

// ignore: must_be_immutable
class Search extends StatelessWidget {
  Search({super.key, required this.colorGradiant});

  TextEditingController cityName = TextEditingController();
  List<Color> colorGradiant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a city",
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colorGradiant,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: TextField(
              controller: cityName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Enter City Name",
                suffixIcon: IconButton(
                  onPressed: () {
                    var getWeatherCubit =
                        BlocProvider.of<GetWeatherCubit>(context);
                    getWeatherCubit.getWeather(cityName: cityName.text);
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
