class City {
  final String name, lastUpdated, icon, weatherStatus, maxTemp, minTemp;
  City(
      {required this.name,
      required this.lastUpdated,
      required this.icon,
      required this.weatherStatus,
      required this.maxTemp,
      required this.minTemp});
  factory City.fromJson(Map<String, dynamic> data) {
    return City(
      name: data["location"]["name"],
      lastUpdated: data["current"]["last_updated"],
      icon: data["forecast"]["forecastday"][0]["day"]['condition']["icon"],
      weatherStatus: data["forecast"]["forecastday"][0]["day"]['condition']
          ["text"],
      maxTemp: data["forecast"]["forecastday"][0]["day"]['maxtemp_c'],
      minTemp: data["forecast"]["forecastday"][0]["day"]['mimtemp_c'],
    );
  }
}
