import 'package:flutter/material.dart';
import 'package:weather_app/Behaviour/Core/Resources/colors_manager.dart';

class Search extends StatelessWidget {
  const Search({super.key});

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
        child: TextField(
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(25,),
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
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: ColorsManager.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
