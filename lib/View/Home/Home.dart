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
  List<Map<String, String>> forecast = [];
  int humidity = 0;
  double windSpeed = 0.0;
  int pressure = 0;
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
    final apiKey = "YOUR_API_KEY"; // Replace with your OpenWeatherMap API key
    
    final url = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final lat = data['coord']['lat'];
        final lon = data['coord']['lon'];

        setState(() {
          city = data['name'];
          temperature = "${data['main']['temp']}°C";
          weatherCondition = data['weather'][0]['description'];
          weatherIcon = getWeatherIcon(data['weather'][0]['icon']);
          humidity = data['main']['humidity'];
          windSpeed = data['wind']['speed'];
          pressure = data['main']['pressure'];
        });

        await fetchForecast(lat, lon, apiKey);
        _controller.forward(from: 0);
        saveCityName(cityName);
      } else {
        showError("City not found. Please try again.");
      }
    } catch (e) {
      showError("An error occurred. Please check your connection.");
    }
  }

  Future<void> fetchForecast(double lat, double lon, String apiKey) async {
    final forecastUrl = "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric";

    try {
      final forecastResponse = await http.get(Uri.parse(forecastUrl));
      if (forecastResponse.statusCode == 200) {
        final forecastData = json.decode(forecastResponse.body);
        List<Map<String, String>> parsedForecast = [];

        for (var i = 0; i < forecastData['list'].length; i += 8) {
          final dayData = forecastData['list'][i];
          final date = DateTime.parse(dayData['dt_txt']);
          parsedForecast.add({
            "day": getDayOfWeek(date),
            "icon": getWeatherIcon(dayData['weather'][0]['icon']),
            "temp": "${dayData['main']['temp']}°C",
          });
        }

        setState(() {
          forecast = parsedForecast;
          isLoading = false;
        });
      } else {
        showError("Failed to fetch forecast data.");
      }
    } catch (e) {
      showError("An error occurred while fetching forecast data.");
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

  String getDayOfWeek(DateTime date) {
    List<String> days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    return days[date.weekday % 7];
  }

  void showError(String message) {
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Weather App",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(
                  isDarkTheme ? Icons.dark_mode : Icons.light_mode,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isDarkTheme = !isDarkTheme;
                  });
                },
              ),
            ],
          ),
          backgroundColor: isDarkTheme ? Colors.grey[900] : Colors.blueAccent,
          elevation: 0,
        ),
        body: AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: isLoading
              ? Center(
                  key: ValueKey('loading'),
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  key: ValueKey('loaded'),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Enter city name",
                            hintStyle: TextStyle(
                              color: isDarkTheme ? Colors.white70 : Colors.grey[700],
                              fontStyle: FontStyle.italic,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: isDarkTheme ? Colors.grey[800] : Colors.grey[200],
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: isDarkTheme ? Colors.white54 : Colors.grey,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                if (city.isNotEmpty && city != "Enter a city") {
                                  fetchWeather(city);
                                }
                              },
                              child: Icon(
                                Icons.search,
                                color: isDarkTheme ? Colors.white54 : Colors.grey,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                            ),
                          ),
                          style: TextStyle(
                            color: isDarkTheme ? Colors.white : Colors.black,
                            fontSize: 16,
                          ),
                          onChanged: (value) {
                            city = value;
                          },
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
                                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
                                      color: isDarkTheme ? Colors.white70 : Colors.black54,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      weatherDetailCard("Humidity", "$humidity%", Icons.water),
                                      weatherDetailCard("Wind", "${windSpeed} m/s", Icons.wind_power),
                                      weatherDetailCard("Pressure", "$pressure hPa", Icons.speed),
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
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: forecast.map((f) {
                              return forecastCard(f["day"]!, f["icon"]!, f["temp"]!);
                            }).toList(),
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

  Widget weatherDetailCard(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.blueAccent),
        SizedBox(height: 5),
        Text(label),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget forecastCard(String day, String icon, String temp) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(day, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(icon, style: TextStyle(fontSize: 32)),
            SizedBox(height: 5),
            Text(temp),
          ],
        ),
      ),
    );
  }
}
