import 'package:dio/dio.dart';
import 'package:weather_app/Behaviour/Models/city.dart';

class CitesData {
  Dio dio = Dio();
  Future<City> getCitesData(String city) async {
    try {
      Response response = await dio.get(
        "https://api.weatherapi.com/v1/forecast.json?"
        "key=1645b7e95dd844b5a0351621250610"
        "&"
        "q=$city",
      );
      Map<String, dynamic> data = response.data;
      return City.fromJson(data);
    } on Exception catch (e) {
      rethrow;
    }
  }
}
