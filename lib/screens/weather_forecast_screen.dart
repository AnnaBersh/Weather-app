import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wether_project/API/weather_api.dart';
import 'package:wether_project/models/wether_forecast_daly.dart';
import 'package:wether_project/screens/city_screen.dart';
import 'package:wether_project/widgets/bottom_list_view.dart';
import 'package:wether_project/widgets/cityview.dart';
import 'package:wether_project/widgets/detail_view.dart';
import 'package:wether_project/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;
  WeatherForecastScreen({this.locationWeather});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  //String _cityName;
  String _cityName = 'Amsterdam';

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      forecastObject = WeatherApi().fetchWeatherForecast();
    }

    // forecastObject.then((weather) {
    //   print(weather.list[0].weather[0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('openweathermap.org',
              style: TextStyle(color: Colors.black87)),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.my_location),
              onPressed: () {
                setState(() {
                  forecastObject = WeatherApi().fetchWeatherForecast();
                });
              }),
          actions: [
            IconButton(
              icon: Icon(Icons.location_city),
              onPressed: () async {
                var tappedName = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return CityScreen();
                }));
                if (tappedName != null) {
                  setState(() {
                    _cityName = tappedName;
                  });

                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(cityName: _cityName, isCity: true);
                }
              },
            )
          ],
        ),
        body: ListView(
          children: [
            Container(
              child: FutureBuilder<WeatherForecast>(
                future: forecastObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(height: 50),
                        CityView(snapshot: snapshot),
                        SizedBox(height: 50),
                        TempView(snapshot: snapshot),
                        SizedBox(height: 50),
                        DatailView(snapshot: snapshot),
                        SizedBox(height: 50),
                        BottomListView(snapshot: snapshot),
                      ],
                    );
                  } else {
                    return Center(
                      child: SpinKitDoubleBounce(
                          color: Colors.orange, size: 100.0),
                    );
                  }
                },
              ),
            )
          ],
        ));
  }
}
