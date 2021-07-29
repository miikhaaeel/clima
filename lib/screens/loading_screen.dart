import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

import 'location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  String apiKey = 'e7aac0565bddb97869fe722a66a8457c';
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    var networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
    var temperature = weatherData['main']['temp'];
    var condition = weatherData['weather'][0]['id'];
    var cityName = weatherData['name'];

    print(temperature);
    print(condition);
    print(cityName);
  }

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getLocationData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
