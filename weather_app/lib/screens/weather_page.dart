import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/blocs/weather_repo.dart';
import 'package:weather_app/models/daily_forecast_model.dart';
import 'package:weather_app/models/forecast_model.dart';
import 'package:weather_app/models/weather_model.dart';

import '../models/location_model.dart';

class CurrentWeatherPage extends StatefulWidget {
  final List<Location> locations;
  final BuildContext context;

  CurrentWeatherPage(this.locations, this.context);

  @override
  _CurrentWeatherPageState createState() =>
      _CurrentWeatherPageState(this.locations, this.context);
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final List<Location> locations;
  final Location location;
  final BuildContext context;

  _CurrentWeatherPageState(List<Location> locations, BuildContext context)
      : this.locations = locations,
        this.context = context,
        this.location = locations[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(166, 205, 247, 1),
        body: ListView(children: <Widget>[
          createTextField(),
          currentWeatherViews(locations, location, context),
          forcastViewsDaily(this.location),
        ]));
  }

  Widget currentWeatherViews(
      List<Location> locations, Location location, BuildContext context) {
    WeatherModel _weather;

    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _weather = snapshot.data as WeatherModel;
          if (_weather == null) {
            return const Text("Error getting weather");
          } else {
            return Column(children: [
              createAppBar(locations, location, context),
              weatherBox(_weather),
              weatherDetailsBox(_weather),
            ]);
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      future: WeatherRepo.getWeather(location),
    );
  }
  Widget weatherBox(WeatherModel _weather) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
              top: 30, left: 130.0, bottom: 15.0, right: 15.0),
          child: Row(
            children: [
              Image(
                  image: NetworkImage("http://openweathermap.org/img/w/" + _weather.icon + ".png")),

              Container(
                child: Text("${_weather.description}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            ],
          ),
        ),

      ],
    );
  }
  Widget weatherDetailsBox(WeatherModel _weather) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 25, bottom: 25, right: 15),
      margin: const EdgeInsets.only(left: 15, top: 5, bottom: 15, right: 15),
      decoration: BoxDecoration(
          color: Color.fromRGBO(54, 84, 210,0.6),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Row(
        children: [
          Expanded(
              child: Column(
                children: [
                  Container(
                      child: const Text(
                        "Temperature",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color.fromRGBO(166, 205, 247, 1)),
                      )),
                  Container(
                      child: Text(
                        "${_weather.temp} °C",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.white),
                      ))
                ],
              )),
          Expanded(
              child: Column(
                children: [
                  Container(
                      child: const Text(
                        "Humidity",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color.fromRGBO(166, 205, 247, 1)),
                      )),
                  Container(
                      child: Text(
                        "${_weather.humidity.toInt()}%",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.white),
                      ))
                ],
              )),
          Expanded(
              child: Column(
                children: [
                  Container(
                      child: const Text(
                        "Wind",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color.fromRGBO(166, 205, 247, 1)),
                      )),
                  Container(
                      child: Text(
                        "${_weather.wind} km/h",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.white),
                      ))
                ],
              ))
        ],
      ),
    );
  }






  Widget createAppBar(
      List<Location> locations, Location location, BuildContext context) {
    return Column(
        children:[
          Container(
              padding:
              const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
              margin: const EdgeInsets.only(
                  top: 35, left: 15.0, bottom: 15.0, right: 15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: '${location.city}, ',
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        TextSpan(
                            text: '${location.country}',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
            child: Text.rich(TextSpan(
                text: getTimeFromTimestamp(DateTime.now().millisecondsSinceEpoch),
                style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: 16))),
          )
        ]

    );

  }

  Widget createTextField() {
    return TextFormField(
      controller: null,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide:
            BorderSide(color: Colors.black87, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide:
            BorderSide(color: Colors.blueGrey, style: BorderStyle.solid)),
        hintText: "City Name",
        hintStyle: TextStyle(color: Colors.black38),
      ),
      style: TextStyle(color: Colors.black87),
    );
  }

  Widget forcastViewsDaily(Location location) {
    ForecastModel _forcast;

    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _forcast = snapshot.data as ForecastModel;
          if (_forcast == null) {
            return const Text("Error getting weather");
          } else {
            return dailyBoxes(_forcast);
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      future: WeatherRepo.getForecastWeather(location),
    );
  }


  Widget dailyBoxes(ForecastModel _forcast) {
    return Expanded(
        child:Column(
          children: [
            Text.rich(TextSpan(
                text: "7 Day Weather Forecast ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding:
            const EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 8),
            itemCount: _forcast.daily.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: const EdgeInsets.only(
                      left: 10, top: 5, bottom: 5, right: 10),
                  margin: const EdgeInsets.all(5),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                          "${getDateFromTimestamp(_forcast.daily[index].dt)}",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )),
                    Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: Image(
                                    image: NetworkImage("http://openweathermap.org/img/w/" + _forcast.daily[index].icon + ".png")),
                            ),

                          Expanded(
                              child: Text(
                                "${_forcast.daily[index].description}",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 14, color: Color.fromRGBO(48, 64, 116,1)),
                              ),
                          )

                          ],

                        )),

                    Expanded(
                        child: Text(
                          "${_forcast.daily[index].temp}"+" °C",                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 14, color: Color.fromRGBO(48, 64, 116,1)),
                        )),
                    Expanded(
                        child: Text(
                          "${_forcast.daily[index].wind}"+" km/h",                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 14, color: Color.fromRGBO(48, 64, 116,1)),
                        )),
                  ]));
            })
          ],
        )
    );

  }


  Image getWeatherIcon(String _icon) {
    String path = 'assets/icons/';
    String imageExtension = ".png";
    return Image.asset(
      path + _icon + imageExtension,
      width: 70,
      height: 70,
    );
  }

  Image getWeatherIconSmall(String _icon) {
    String path = 'assets/icons/';
    String imageExtension = ".png";
    return Image.asset(
      path + _icon + imageExtension,
      width: 40,
      height: 40,
    );
  }



  String getTimeFromTimestamp(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var formatter = DateFormat('EEE d MMM yyyy');
    return formatter.format(date);
  }

  String getDateFromTimestamp(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formatter = DateFormat('EEE d MMM yyyy');
    return formatter.format(date);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    //cityController.dispose();
    super.dispose();
  }
}



