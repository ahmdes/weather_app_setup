import 'package:flutter/material.dart';
import 'package:weather_app/Behaviour/Core/Resources/colors_manager.dart';
import 'package:weather_app/Presentation/views/search.dart';

import '../widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.blue,
        title: Text(
          'Weather App',
          style: TextStyle(
              color: ColorsManager.white,
              fontSize: 30,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Search(),
                ),
              );
            },
            icon: Icon(
              Icons.search,
              color: ColorsManager.white,
              size: 40,
            ),
          ),
        ],
      ),
      body: const NoWeatherBody(),
    );
  }
}
