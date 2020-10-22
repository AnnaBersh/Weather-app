import 'package:flutter/material.dart';
import 'package:wether_project/models/wether_forecast_daly.dart';
import 'package:intl/intl.dart';
import 'package:wether_project/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var city = snapshot.data.city.name;
    var country = snapshot.data.city.country;
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
    return Container(
      child: Column(
        children: [
          Text('$city, $country',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 28)),
          Text('${Util.getFormattedDate(formattedDate)}',
              style: TextStyle(fontSize: 15))
        ],
      ),
    );
  }
}
