import 'package:flutter/material.dart';
class InsightsModel {
  String name;
  String iconPath;
  Color boxColor;

  InsightsModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<InsightsModel> getInsights() {
    List<InsightsModel> insights = [];
    insights.add(
      InsightsModel(
        name: 'Trending Destination',
        iconPath: 'assets/images/insights&locals/destination.png',
        boxColor: Color.fromARGB(255, 243, 243, 243),
        )
    );
    insights.add(
      InsightsModel(
        name: 'Weather Friendly',
        iconPath: 'assets/images/insights&locals/weather_friendly.png',
        boxColor: Color.fromARGB(255, 240, 245, 250),
        )
    );
    insights.add(
      InsightsModel(
        name: 'Hidden Gem Place',
        iconPath: 'assets/images/insights&locals/hidden_gem.png',
        boxColor: Color.fromARGB(255, 243, 243, 243),
        )
    );
    return insights;
  }
}
