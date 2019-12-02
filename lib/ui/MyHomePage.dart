import 'package:flutter/material.dart';
import 'package:my_weather_app/api/Location.Api.dart';
import 'weather.dart';
import 'package:my_weather_app/model/WeatherData.dart';
import 'package:my_weather_app/api/Map.Api.dart';
import 'dart:developer' as developer;

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}): super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  WeatherData _weatherData;
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: _weatherData != null ? Weather(weatherData: _weatherData):
      Center(
        child: CircularProgressIndicator(
          strokeWidth: 4.0,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      )
    );
  }

  getCurrentLocation () async{
    
    LocationApi _locationApi = LocationApi.getInstance();
    developer.log('getting the locations...');
    //final location = await _locationApi.getLocation();
    //developer.log(location.lat.toString() + ' Lon: ' + location.lon.toString());
    //loadWeather(lat: location.lat, lon: location.lon);
    loadWeather(lat: 13.067, lon:80.237);
  }

loadWeather({double lat, double lon}) async{

  MapApi mapApi = MapApi.getInstance();
  final data = await mapApi.getWeatherData(lat: lat, lon:lon);
  setState(() {
    this._weatherData = data;
  });
}

}