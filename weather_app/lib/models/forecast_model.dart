import 'package:weather_app/models/daily_forecast_model.dart';

class ForecastModel {
  final List<DailyForcastModel> daily;

  ForecastModel({ required this.daily});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> dailyData = json['daily'];


    List<DailyForcastModel> daily = [];



    dailyData.forEach((item) {
      var day = DailyForcastModel.fromJson(item);
      daily.add(day);
    });

    return ForecastModel( daily: daily);
  }
}
