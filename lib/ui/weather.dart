import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/model/WeatherData.dart';
//import 'package:intl/intl.dart';

class Weather extends StatelessWidget{

  final WeatherData weatherData;
  Weather({@required this.weatherData});

  @override
  Widget build(BuildContext context) {

    Widget dateSection = Container(
      child: Text(
        DateFormat( 'MMMM d, HH:mm').format(DateTime.now()),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );

    Widget temperatureSection = Container(
      padding: EdgeInsets.symmetric(
        vertical:10.0
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(weatherData.temparature.toStringAsFixed(0),
          style: TextStyle(fontSize:80.0),),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top:12.0,
              ),
              margin: EdgeInsets.only(left: 6.0),
              child: Text('\u2103',
              style: TextStyle(fontSize: 24.0),),
            ),
          ),
          //Image.asset('assets/img/cloudy.png',
          // width: 100.0,
          // height: 100.0,
          // fit: BoxFit.cover)
          Image.network('http://openweathermap.org/img/w/${weatherData.icon}.png',
          width: 100,
          height: 100,
          fit:BoxFit.cover
          )
        ],
      ),
    );


    Widget temparatureDescriptionSection = Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              //'Chennai',
              weatherData.place,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            Text(
              // 'Cloudy',
              weatherData.main,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            )
          ],
        ),
    );

   return Container(
     padding: const EdgeInsets.all(60.0),
     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       dateSection,
       temperatureSection,
       temparatureDescriptionSection
     ],),
   );
  }

}