import 'package:my_weather_app/model/LocationData.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class LocationApi{
  LocationModel _location;
  Location location = Location();
  String error;

  static LocationApi _instance;
  static LocationApi getInstance() =>  _instance ??= LocationApi();

  Future<LocationModel> getLocation() async{

    try{

      var userLocation = await location.getLocation();
      _location = LocationModel(
        lat: userLocation.latitude,
        lon: userLocation.longitude
      );
      error = null;
    } on PlatformException catch(e){
      if (e.code == 'PERMISSION_DENIED'){
        error = 'Permission denied';
      }else if (e.code == 'PERMISSION_DENIED_NEVER_ASK'){
        error = 'Permssion denied - please ask the user to enable it from the App Settings';
      }
      _location = null;
    }
    return _location;
  }
}