import 'package:flutter/material.dart';
import 'package:weather_project/models/weather_forecast_daly.dart';
import 'package:weather_project/widgets/forecast_Card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const BottomListView({this.snapshot});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('7-Day Weather Forecast'.toUpperCase(),
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold)),
          Container(
            height: 140,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8.0),
              itemCount: snapshot.data.list.length,
              itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  height: 160.0,
                  color: Colors.orange,
                  child: forecastCard(snapshot, index)),
            ),
          )
        ],
      ),
    );
  }
}
