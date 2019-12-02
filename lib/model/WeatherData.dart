import 'dart:convert';

class WeatherData{
  final String place;
  final double temparature;
  final String main;
  final String icon;

  WeatherData({this.place, this.temparature, this.main, this.icon});

  static WeatherData deserialize(String json){
    JsonDecoder decoder = JsonDecoder();
    var map = decoder.convert(json);
    String place = map['name'];
    double temperature = map['main']['temp'].toDouble();
    String main = map['weather'][0]['main'];
    String icon = map['weather'][0]['icon'];
    return WeatherData(place:place, temparature: temperature, main: main, icon: icon );
  }

}