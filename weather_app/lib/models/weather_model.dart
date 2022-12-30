class WeatherModel{
  final double temp;
  final double feelsLike;
  final double low;
  final double high;
  final String description;
  final double pressure;
  final double humidity;
  final double wind;
  final String icon;

  WeatherModel(
      this.temp,
         this.feelsLike,
         this.low,
         this.high,
         this.description,
         this.pressure,
         this.humidity,
         this.wind,
         this.icon);



  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(
      json['main']['temp'].toDouble(),
      json['main']['feels_like'].toDouble(),
      json['main']['temp_min'].toDouble(),
      json['main']['temp_max'].toDouble(),
      json['weather'][0]['description'],
      json['main']['pressure'].toDouble(),
      json['main']['humidity'].toDouble(),
      json['wind']['speed'].toDouble(),
      json['weather'][0]['icon'],
    );

  }
}