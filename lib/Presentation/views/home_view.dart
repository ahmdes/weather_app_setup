import 'package:flutter/material.dart';
import 'package:weather_app/Behaviour/Core/Resources/colors_manager.dart';
import 'package:weather_app/Behaviour/Models/city.dart';
import 'package:weather_app/Behaviour/services/cites_data.dart';
import 'package:weather_app/Presentation/views/search.dart';

import '../widgets/build_city_view.dart';
import '../widgets/no_weather_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
    this.cityName,
  }) : super(key: key);
  final String? cityName;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
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
                  builder: (context) => Search(),
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
      body: widget.cityName == null
          ? const NoWeatherBody()
          : FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error : ${snapshot.error}",
                      style: TextStyle(
                        color: ColorsManager.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (snapshot.hasData) {
                  return BuildCityView(cityData: snapshot.data);
                } else {
                  return Center(
                    child: Text(
                      "There is no data",
                      style: TextStyle(
                        color: ColorsManager.orange,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  );
                }
              },
            ),
    );
  }
}
