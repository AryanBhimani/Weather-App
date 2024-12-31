// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String city = "Enter a city"; // Placeholder city name
//   String temperature = "--°C"; // Placeholder temperature
//   String weatherCondition = "Unknown"; // Placeholder weather condition
//   String weatherIcon = "❓"; // Placeholder icon
//   bool isLoading = false;

//   Future<void> fetchWeather(String cityName) async {
//     // final apiKey = "YOUR_API_KEY"; // Replace with your OpenWeatherMap API key

//     // ignore: prefer_const_declarations
//     final apiKey = "cb03cbe1e18d2c33c247c5927959d639";
//     final url = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";

//     setState(() {
//       isLoading = true;
//     });

//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           city = data['name'];
//           temperature = "${data['main']['temp']}°C";
//           weatherCondition = data['weather'][0]['description'];
//           weatherIcon = getWeatherIcon(data['weather'][0]['icon']);
//           isLoading = false;
//         });
//       } else {
//         showError("City not found. Please try again.");
//       }
//     } catch (e) {
//       showError("An error occurred. Please check your connection.");
//     }
//   }

//   // Map weather icon code to emoji
//   String getWeatherIcon(String iconCode) {
//     switch (iconCode) {
//       case "01d":
//         return "☀️";
//       case "01n":
//         return "🌙";
//       case "02d":
//       case "02n":
//         return "⛅";
//       case "03d":
//       case "03n":
//         return "☁️";
//       case "04d":
//       case "04n":
//         return "☁️";
//       case "09d":
//       case "09n":
//         return "🌧️";
//       case "10d":
//       case "10n":
//         return "🌦️";
//       case "11d":
//       case "11n":
//         return "🌩️";
//       case "13d":
//       case "13n":
//         return "❄️";
//       case "50d":
//       case "50n":
//         return "🌫️";
//       default:
//         return "❓";
//     }
//   }

//   // Display error message
//   void showError(String message) {
//     setState(() {
//       isLoading = false;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Weather App"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Search Bar
//             TextField(
//               decoration: InputDecoration(
//                 hintText: "Enter city name",
//                 border: OutlineInputBorder(),
//                 suffixIcon: Icon(Icons.search),
//               ),
//               onSubmitted: (value) {
//                 if (value.isNotEmpty) {
//                   fetchWeather(value); // Fetch weather for the entered city
//                 }
//               },
//             ),
//             SizedBox(height: 20),
//             // Weather Information
//             if (isLoading)
//               CircularProgressIndicator()
//             else ...[
//               Text(
//                 weatherIcon,
//                 style: TextStyle(fontSize: 64),
//               ),
//               Text(
//                 city,
//                 style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 temperature,
//                 style: TextStyle(fontSize: 48),
//               ),
//               Text(
//                 weatherCondition,
//                 style: TextStyle(fontSize: 24, color: Colors.grey[700]),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }







import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String city = "Enter a city"; // Placeholder city name
  String temperature = "--°C"; // Placeholder temperature
  String weatherCondition = "Unknown"; // Placeholder weather condition
  String weatherIcon = "❓"; // Placeholder icon
  bool isLoading = false;

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
          isLoading = false;
        });
      } else {
        showError("City not found. Please try again.");
      }
    } catch (e) {
      showError("An error occurred. Please check your connection.");
    }
  }

  // Map weather icon code to emoji
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

  // Display error message
  void showError(String message) {
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Color getBackgroundColor() {
    switch (weatherCondition.toLowerCase()) {
      case "clear sky":
        return Colors.blueAccent;
      case "few clouds":
        return Colors.lightBlue;
      case "scattered clouds":
      case "broken clouds":
        return Colors.grey;
      case "shower rain":
      case "rain":
        return Colors.indigo;
      case "thunderstorm":
        return Colors.deepPurple;
      case "snow":
        return Colors.white;
      case "mist":
        return Colors.teal;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        centerTitle: true,
        backgroundColor: getBackgroundColor(),
      ),
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getBackgroundColor(),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              if (isLoading)
                CircularProgressIndicator()
              else ...[
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: Column(
                    key: ValueKey<String>(city),
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
                            color: Colors.white),
                      ),
                      Text(
                        temperature,
                        style: TextStyle(fontSize: 48, color: Colors.white),
                      ),
                      Text(
                        weatherCondition,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}











import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String city = "Enter a city"; // Placeholder city name
  String temperature = "--°C"; // Placeholder temperature
  String weatherCondition = "Unknown"; // Placeholder weather condition
  String weatherIcon = "❓"; // Placeholder icon
  bool isLoading = false;

  Future<void> fetchWeather(String cityName) async {
    final apiKey = "cb03cbe1e18d2c33c247c5927959d639";
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";

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
          isLoading = false;
        });
      } else {
        showError("City not found. Please try again.");
      }
    } catch (e) {
      showError("An error occurred. Please check your connection.");
    }
  }

  // Map weather icon code to emoji
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

  // Display error message
  void showError(String message) {
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Color getBackgroundColor() {
    switch (weatherCondition.toLowerCase()) {
      case "clear sky":
        return Colors.blueAccent;
      case "few clouds":
        return Colors.lightBlue;
      case "scattered clouds":
      case "broken clouds":
        return Colors.grey;
      case "shower rain":
      case "rain":
        return Colors.indigo;
      case "thunderstorm":
        return Colors.deepPurple;
      case "snow":
        return Colors.white;
      case "mist":
        return Colors.teal;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        centerTitle: true,
        backgroundColor: getBackgroundColor(),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getBackgroundColor(),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter city name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.search),
                  ),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      fetchWeather(value); // Fetch weather for the entered city
                    }
                  },
                ),
                SizedBox(height: 20),
                // Weather Information Card
                if (isLoading)
                  CircularProgressIndicator()
                else
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      key: ValueKey<String>(city),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            getBackgroundColor(),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      padding: EdgeInsets.all(16),
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
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            temperature,
                            style: TextStyle(
                              fontSize: 48,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            weatherCondition,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
