import 'package:flutter/material.dart';
import 'dart:math'; // Needed for the Random class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: WeatherInfoForm(),
      ),
    );
  }
}

class WeatherInfoForm extends StatefulWidget {
  @override
  _WeatherInfoFormState createState() => _WeatherInfoFormState();
}

class _WeatherInfoFormState extends State<WeatherInfoForm> {
  List<Map<String, String>> _weeklyForecast = [];

  void _fetch7DayForecast() {
    Random random = Random();
    List<Map<String, String>> forecast = [];
    List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];

    for (int i = 0; i < 7; i++) {
      int temperature = random.nextInt(16) + 15; // Random temperature
      String condition = conditions[random.nextInt(conditions.length)];
      forecast.add({
        'day': 'Day ${i + 1}',
        'temperature': '$temperature°C',
        'condition': condition,
      });
    }

    setState(() {
      _weeklyForecast = forecast;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _fetch7DayForecast,
            child: Text('Fetch 7-Day Forecast'),
          ),
          SizedBox(height: 20.0),
          Column(
            children: _weeklyForecast.map((dayForecast) {
              return ListTile(
                title: Text(dayForecast['day']!),
                subtitle: Text('Temp: ${dayForecast['temperature']}, Condition: ${dayForecast['condition']}'),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
