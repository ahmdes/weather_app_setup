import 'package:dio/dio.dart';
import 'package:weather_app/Behaviour/Models/city.dart';

class CitesData {
  Dio dio = Dio();
  String baseUrl = "https://api.weatherapi.com/v1";
  String apiKey = "1645b7e95dd844b5a0351621250610";
  Future<City> getCitesData(String city) async {
    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$city",
      );
      Map<String, dynamic> data = response.data;
      return City.fromJson(data);
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['error']['message'] ?? "OOPS , There was an error.";
      throw Exception(errorMessage);
    } on Exception {
      throw Exception("OOPS , There was an error.");
    }
  }
}
