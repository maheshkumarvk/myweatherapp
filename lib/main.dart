import 'package:flutter/material.dart';
import 'package:my_weather_app/ui/MyHomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: new MyHomePage(title: 'Weather Application')
    );
  }
}

