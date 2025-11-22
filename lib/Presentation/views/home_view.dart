import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Behaviour/Core/Resources/colors_manager.dart';
import 'package:weather_app/Behaviour/Models/city.dart';
import 'package:weather_app/Behaviour/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Behaviour/cubites/get_weather_cubit/weather_cubit_states.dart';
import 'package:weather_app/Behaviour/services/cites_data.dart';
import 'package:weather_app/Presentation/views/search.dart';
import 'package:weather_app/Presentation/widgets/weather_info_body.dart';
import '../widgets/no_weather_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
    this.cityName,
    required this.colorGradiant,
  }) : super(key: key);
  final String? cityName;
  final List<Color> colorGradiant;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    if (widget.cityName != null) {
      getData();
    }
  }

  Future<City> getData() async {
    return await CitesData().getCitesData(widget.cityName!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Search(
                    colorGradiant: widget.colorGradiant,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 40,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherData) {
            return const NoWeatherBody();
          } else if (state is ShowWeatherData) {
            return WeatherInfoBody(
              colorGradiant: widget.colorGradiant,
            );
          } else {
            return Center(
              child: Text(
                "OOPS , there was an error",
                style: TextStyle(
                  color: ColorsManager.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
