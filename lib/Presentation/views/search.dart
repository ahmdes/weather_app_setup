import 'package:flutter/material.dart';
import 'package:weather_app/Behaviour/Core/Resources/colors_manager.dart';
import 'package:weather_app/Presentation/views/home_view.dart';

class Search extends StatelessWidget {
  Search({super.key});

  TextEditingController cityName = TextEditingController();
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(
                          cityName: cityName.text,
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                    color: ColorsManager.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
