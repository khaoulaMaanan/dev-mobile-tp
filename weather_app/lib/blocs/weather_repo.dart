import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/forecast_model.dart';
import '../models/location_model.dart';
import '../models/weather_model.dart';

class WeatherRepo{
  static String lang = "fr";
  static String units = "metric";
  static String cnt = "7";
  static String appid = "804cb7fa61b64d471d6ee770f62c0be6";

  static Future<WeatherModel> getWeather(Location location) async{
    String cityName = location.city;
    var finalUrl =
"https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$appid&units=$units";    final result = await http.Client().get(Uri.parse(finalUrl));

    if(result.statusCode != 200)
      throw Exception();
    //print(result.body);
    return parsedJson(result.body);
  }
  static Future<WeatherModel> getWeatherForecast({required String cityName}) async {
    var finalUrl =
        "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&lang=$lang&units=$units&cnt=$cnt&appid=$appid";

    final response = await http.get(Uri.parse(finalUrl));
    print("URL : ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      print("weather data: ${response.body}}");
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting $cityName weather forecast");
    }
  }


  static WeatherModel parsedJson(final response){
    final jsonDecoded = json.decode(response);


    //final jsonWeather = jsonDecoded["main"];

    return WeatherModel.fromJson(jsonDecoded);
  }
  static Future getForecastWeather(Location location) async {
    String lat = location.lat;
    String lon = location.lon;
    var finalUrl =
        "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$appid&units=$units";

    final response = await http.get(Uri.parse(finalUrl));
    print("URL : ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      print("weather data: ${response.body}}");
      return ForecastModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error getting {lat:$lat;lon:$lon} weather forecast");
    }
  }

}