import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String city = "New York"; // Default city
  String temperature = "25°C"; // Dummy data
  String weatherCondition = "Sunny"; // Dummy data
  String weatherIcon = "☀️"; // Dummy data

  // Placeholder for API call
  void fetchWeather(String cityName) {
    // Simulate an API response
    setState(() {
      city = cityName;
      temperature = "22°C"; // Update temperature dynamically
      weatherCondition = "Cloudy"; // Update weather dynamically
      weatherIcon = "☁️"; // Update icon dynamically
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Enter city name",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  fetchWeather(value); // Fetch weather for the entered city
                }
              },
            ),
            SizedBox(height: 20),
            // Weather Information
            Text(
              "$weatherIcon",
              style: TextStyle(fontSize: 64),
            ),
            Text(
              "$city",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              "$temperature",
              style: TextStyle(fontSize: 48),
            ),
            Text(
              "$weatherCondition",
              style: TextStyle(fontSize: 24, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
