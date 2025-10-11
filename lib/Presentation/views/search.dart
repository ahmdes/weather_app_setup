import 'package:flutter/material.dart';
import 'package:weather_app/Behaviour/Core/Resources/colors_manager.dart';
import 'package:weather_app/Behaviour/services/cites_data.dart';

import '../../Behaviour/Models/city.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController cityName = TextEditingController();
  Future<City>? future;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorsManager.white,
          size: 30,
        ),
        title: Text(
          "Search a city",
          style: TextStyle(
            color: ColorsManager.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        backgroundColor: ColorsManager.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: cityName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(
                  25,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorsManager.orange),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  borderSide: BorderSide(color: ColorsManager.orange),
                ),
                labelText: "Search",
                labelStyle: TextStyle(
                  color: ColorsManager.orange,
                  fontSize: 20,
                ),
                hintText: "Enter City Name",
                hintStyle: TextStyle(
                  color: ColorsManager.brown,
                  fontSize: 20,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      future = CitesData().getCitesData(cityName.text);
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    color: ColorsManager.black,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 450,
              decoration: BoxDecoration(
                color: ColorsManager.brown,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 2,
                  color: ColorsManager.blue,
                ),
              ),
              child: FutureBuilder(
                future: future,
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (future == null) {
                    return Center(
                      child: Text(
                        "Enter Your City",
                        style: TextStyle(
                          color: ColorsManager.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
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
                    return BuildCityView(
                      cityData: snapshot.data,
                    );
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
            ),
          ],
        ),
      ),
    );
  }
}

class BuildCityView extends StatelessWidget {
  const BuildCityView({
    super.key,
    required this.cityData,
  });
  final City cityData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cityData.name,
          style: TextStyle(
            color: ColorsManager.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        Text(
          "${cityData.minTemp}",
          style: TextStyle(
            color: ColorsManager.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        Image.network(
          "https:${cityData.icon}",
          width: 200,
          height: 150,
        ),
        Text(
          cityData.lastUpdated,
          style: TextStyle(
            color: ColorsManager.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        Text(
          cityData.weatherStatus,
          style: TextStyle(
            color: ColorsManager.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
