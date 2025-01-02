import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  String city = "Enter a city";
  String temperature = "--°C";
  String weatherCondition = "Unknown";
  String weatherIcon = "❓";
  int humidity = 0;
  double windSpeed = 0.0;
  int pressure = 0;
  int visibility = 0;
  bool isLoading = false;
  bool isDarkTheme = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    loadLastCity();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> saveCityName(String cityName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_city', cityName);
  }

  Future<void> loadLastCity() async {
    final prefs = await SharedPreferences.getInstance();
    final lastCity = prefs.getString('last_city') ?? "Enter a city";
    setState(() {
      city = lastCity;
    });
    if (lastCity != "Enter a city") {
      fetchWeather(lastCity);
    }
  }

  Future<void> fetchWeather(String cityName) async {
    // final apiKey = "YOUR_API_KEY"; // Replace with your OpenWeatherMap API key
    final apiKey = "cb03cbe1e18d2c33c247c5927959d639";
    final url ="https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          city = data['name'];
          temperature = "${data['main']['temp']}°C";
          weatherCondition = data['weather'][0]['description'];
          weatherIcon = getWeatherIcon(data['weather'][0]['icon']);
          humidity = data['main']['humidity'];
          windSpeed = data['wind']['speed'];
          pressure = data['main']['pressure'];
          visibility = data['visibility'] ~/ 1000; // Convert meters to km
          isLoading = false;
          _controller.forward(from: 0); // Trigger animation
        });
        saveCityName(cityName);
      } else {
        showError("City not found. Please try again.");
      }
    } catch (e) {
      showError("An error occurred. Please check your connection.");
    }
  }

  String getWeatherIcon(String iconCode) {
    switch (iconCode) {
      case "01d":
        return "☀️";
      case "01n":
        return "🌙";
      case "02d":
      case "02n":
        return "⛅";
      case "03d":
      case "03n":
        return "☁️";
      case "04d":
      case "04n":
        return "☁️";
      case "09d":
      case "09n":
        return "🌧️";
      case "10d":
      case "10n":
        return "🌦️";
      case "11d":
      case "11n":
        return "🌩️";
      case "13d":
      case "13n":
        return "❄️";
      case "50d":
      case "50n":
        return "🌫️";
      default:
        return "❓";
    }
  }

  void showError(String message) {
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Weather App",
            style: TextStyle(
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          actions: [
            Switch(
              value: isDarkTheme,
              onChanged: (value) {
                setState(() {
                  isDarkTheme = value;
                });
              },
            )
          ],
        ),
        body: AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: isLoading
              ? Center(
            key: ValueKey('loading'),
            child: CircularProgressIndicator(),
          )
              : SingleChildScrollView( // Ensures vertical scrollable content
            key: ValueKey('loaded'),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter city name",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        fetchWeather(value);
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  ScaleTransition(
                    scale: _controller,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              weatherIcon,
                              style: TextStyle(fontSize: 64),
                            ),
                            Text(
                              city,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              temperature,
                              style: TextStyle(
                                fontSize: 48,
                                color: Colors.blueAccent,
                              ),
                            ),
                            Text(
                              weatherCondition,
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text("Humidity"),
                                    Text("$humidity%"),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Wind Speed"),
                                    Text("${windSpeed} m/s"),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Pressure"),
                                    Text("$pressure hPa"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Future Forecast",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 120, // Ensures consistent height for forecast list
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        forecastCard("Mon", "☀️", "32°C"),
                        forecastCard("Tue", "🌧️", "28°C"),
                        forecastCard("Wed", "⛅", "30°C"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget forecastCard(String day, String icon, String temp) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day),
            Text(icon, style: TextStyle(fontSize: 32)),
            Text(temp),
          ],
        ),
      ),
    );
  }
}
