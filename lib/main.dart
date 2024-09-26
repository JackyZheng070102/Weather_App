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
  final TextEditingController _controller = TextEditingController();
  String _cityName = '';
  String _temperature = 'N/A';
  String _weatherCondition = 'N/A';

  void _fetchWeather() {
    // Placeholder for weather fetching logic
    setState(() {
      _cityName = _controller.text;
      _temperature = '25°C'; // Dummy value
      _weatherCondition = 'Sunny'; // Dummy value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter City Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _fetchWeather,
            child: Text('Fetch Weather'),
          ),
          SizedBox(height: 20.0),
          Text('City: $_cityName', style: TextStyle(fontSize: 20)),
          Text('Temperature: $_temperature', style: TextStyle(fontSize: 20)),
          Text('Condition: $_weatherCondition', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

