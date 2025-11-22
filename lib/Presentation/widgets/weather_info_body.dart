import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Behaviour/Core/Resources/colors_manager.dart';
import 'package:weather_app/Behaviour/Models/city.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:weather_app/Behaviour/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:date_format/date_format.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    Key? key,
    required this.colorGradiant,
  }) : super(key: key);
  final List<Color> colorGradiant;
  @override
  Widget build(BuildContext context) {
    City cityData = BlocProvider.of<GetWeatherCubit>(context).cityWeatherData!;
    var fromattedDate = formatDate(cityData.lastUpdated, [hh, ":", mm]);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: colorGradiant,
      )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cityData.name,
                style: TextStyle(
                  color: ColorsManager.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                ),
              ),
              Text(
                "Updated at   $fromattedDate",
                style: TextStyle(
                  color: ColorsManager.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              "https:${cityData.icon}"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Text(
                    " ${cityData.maxTemp.round()}",
                    style: TextStyle(
                      color: ColorsManager.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        "minTemp : ${cityData.minTemp.round()}",
                        style: TextStyle(
                          color: ColorsManager.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "maxTemp : ${cityData.maxTemp.round()}",
                        style: TextStyle(
                          color: ColorsManager.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                cityData.weatherStatus,
                style: TextStyle(
                  color: ColorsManager.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
