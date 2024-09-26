import 'package:flutter/material.dart';

void main() {
  runApp(WeatherInfoApp());
}

class WeatherInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Info'),
        ),
        body: Center(
          child: Text('Welcome to the Weather Info App!'),
        ),
      ),
    );
  }
}

