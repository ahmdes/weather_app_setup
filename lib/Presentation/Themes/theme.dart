import 'package:flutter/material.dart';
import 'package:weather_app/Behaviour/Core/Resources/colors_manager.dart';

class Themes {
  static final ThemeData light = ThemeData(
    // primaryColor: Colors.green,
    // brightness: Brightness.light,
    // scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.blue,
      titleTextStyle: TextStyle(
        color: ColorsManager.white,
        fontWeight: FontWeight.w700,
        fontSize: 30,
      ),
      iconTheme: IconThemeData(
        color: ColorsManager.white,
        size: 30,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // filled: true,
      // fillColor: Colors.white,
      hintStyle: TextStyle(color: ColorsManager.black),
      labelStyle: TextStyle(color: ColorsManager.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ColorsManager.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ColorsManager.black),
      ),
      contentPadding: const EdgeInsets.all(
        25,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
        borderSide: BorderSide(color: ColorsManager.black),
      ),
      suffixIconColor: ColorsManager.black,
    ),
  );

  static final ThemeData sunny = ThemeData(
    // primaryColor: Colors.green,
    // brightness: Brightness.dark,
    // scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.orange,
      titleTextStyle: TextStyle(
        color: ColorsManager.white,
        fontWeight: FontWeight.w700,
        fontSize: 30,
      ),
      iconTheme: IconThemeData(
        color: ColorsManager.white,
        size: 30,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // filled: true,
      // fillColor: Colors.white,
      hintStyle: TextStyle(color: ColorsManager.black),
      labelStyle: TextStyle(color: ColorsManager.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ColorsManager.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ColorsManager.black),
      ),
      contentPadding: const EdgeInsets.all(
        25,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
        borderSide: BorderSide(color: ColorsManager.black),
      ),
      suffixIconColor: ColorsManager.black,
    ),
  );

  static final ThemeData rainy = ThemeData(
    // primaryColor: Colors.green,
    // brightness: Brightness.dark,
    // scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.blue,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 30,
      ),
      iconTheme: IconThemeData(
        color: ColorsManager.white,
        size: 30,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // filled: true,
      // fillColor: Colors.white,
      hintStyle: TextStyle(color: ColorsManager.black),
      labelStyle: TextStyle(color: ColorsManager.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ColorsManager.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ColorsManager.black),
      ),
      contentPadding: const EdgeInsets.all(
        25,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
        borderSide: BorderSide(color: ColorsManager.black),
      ),
      suffixIconColor: ColorsManager.black,
    ),
  );
}
