import 'package:flutter/material.dart';

import '../../Behaviour/Core/Resources/colors_manager.dart';
import '../../Behaviour/Models/city.dart';

class BuildCityView extends StatelessWidget {
  const BuildCityView({
    super.key,
    required this.cityData,
  });
  final City cityData;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              "Updated at : ${cityData.lastUpdated}",
              style: TextStyle(
                color: ColorsManager.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https:${cityData.icon}"),
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  "${cityData.maxTemp}",
                  style: TextStyle(
                    color: ColorsManager.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Text(
                      "${cityData.minTemp}",
                      style: TextStyle(
                        color: ColorsManager.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "${cityData.maxTemp}",
                      style: TextStyle(
                        color: ColorsManager.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
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
    );
  }
}
