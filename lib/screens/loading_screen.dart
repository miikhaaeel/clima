import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    //var url = Uri.https('api.openweathermap.org', '/data/2.5/weather');

    var response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=e7aac0565bddb97869fe722a66a8457c'));
    print(response.statusCode);
    print(response.body);
    //https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=e7aac0565bddb97869fe722a66a8457c
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
