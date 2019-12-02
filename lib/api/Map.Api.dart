import 'package:http/http.dart' show Client;
import 'package:my_weather_app/model/WeatherData.dart';

class MapApi{
  
  static const _apiKey = 'a2e2a7556ff2457fdd118ac307c28b21';
  static const _endPoint = 'http://api.openweathermap.org/data/2.5';
  double lat, lon;
  Client client = Client();

  static MapApi _instance;
  static MapApi getInstance()=> _instance ??= MapApi();
  String _apiCall({double lat, double lon}){
    return _endPoint + "/weather?lat=" + lat.toString() + "&lon=" +lon.toString() + 
                "&APPID=" + _apiKey + "&units=metric";            
  }

  getWeatherData({double lat, double lon}) async {
    var response = await client.get(
      Uri.encodeFull(_apiCall(lat: lat, lon:lon)),
      headers:{'Accept':'application/json'}
    );
    return WeatherData.deserialize(response.body);
  }

}