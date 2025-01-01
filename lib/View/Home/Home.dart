// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   String city = "Enter a city"; // Placeholder city name
//   String temperature = "--°C"; // Placeholder temperature
//   String weatherCondition = "Unknown"; // Placeholder weather condition
//   String weatherIcon = "❓"; // Placeholder icon
//   bool isLoading = false;
//
//   Future<void> fetchWeather(String cityName) async {
//     // final apiKey = "YOUR_API_KEY"; // Replace with your OpenWeatherMap API key
//     final apiKey = "cb03cbe1e18d2c33c247c5927959d639";
//     final url = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
//
//     setState(() {
//       isLoading = true;
//     });
//
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
//
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
//
//   // Display error message
//   void showError(String message) {
//     setState(() {
//       isLoading = false;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   Color getBackgroundColor() {
//     switch (weatherCondition.toLowerCase()) {
//       case "clear sky":
//         return Colors.blueAccent;
//       case "few clouds":
//         return Colors.lightBlue;
//       case "scattered clouds":
//       case "broken clouds":
//         return Colors.grey;
//       case "shower rain":
//       case "rain":
//         return Colors.indigo;
//       case "thunderstorm":
//         return Colors.deepPurple;
//       case "snow":
//         return Colors.white;
//       case "mist":
//         return Colors.teal;
//       default:
//         return Colors.blueGrey;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Weather App"),
//         centerTitle: true,
//         backgroundColor: getBackgroundColor(),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               getBackgroundColor(),
//               Colors.white,
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Search Bar
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: "Enter city name",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     suffixIcon: Icon(Icons.search),
//                   ),
//                   onSubmitted: (value) {
//                     if (value.isNotEmpty) {
//                       fetchWeather(value); // Fetch weather for the entered city
//                     }
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 // Weather Information Card
//                 if (isLoading)
//                   CircularProgressIndicator()
//                 else
//                   AnimatedSwitcher(
//                     duration: Duration(milliseconds: 500),
//                     child: Container(
//                       key: ValueKey<String>(city),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black26,
//                             blurRadius: 8,
//                             offset: Offset(0, 4),
//                           ),
//                         ],
//                         gradient: LinearGradient(
//                           colors: [
//                             Colors.white,
//                             getBackgroundColor(),
//                           ],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                       ),
//                       padding: EdgeInsets.all(16),
//                       child: Column(
//                         children: [
//                           Text(
//                             weatherIcon,
//                             style: TextStyle(fontSize: 64),
//                           ),
//                           Text(
//                             city,
//                             style: TextStyle(
//                               fontSize: 32,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Text(
//                             temperature,
//                             style: TextStyle(
//                               fontSize: 48,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           Text(
//                             weatherCondition,
//                             style: TextStyle(
//                               fontSize: 24,
//                               color: Colors.black54,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//




// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   String city = "Enter a city"; // Placeholder city name
//   String temperature = "--°C"; // Placeholder temperature
//   String weatherCondition = "Unknown"; // Placeholder weather condition
//   String weatherIcon = "❓"; // Placeholder icon
//   bool isLoading = false;
//   late FlutterLocalNotificationsPlugin notificationsPlugin;
//
//   @override
//   void initState() {
//     super.initState();
//     initializeNotifications();
//   }
//
//   void initializeNotifications() {
//     notificationsPlugin = FlutterLocalNotificationsPlugin();
//
//     const androidInitialization = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const initializationSettings = InitializationSettings(android: androidInitialization);
//
//     notificationsPlugin.initialize(initializationSettings);
//   }
//
//   Future<void> showNotification(String title, String body) async {
//     const androidDetails = AndroidNotificationDetails(
//       'weather_channel_id',
//       'Weather Notifications',
//       channelDescription: 'Notifications about weather updates',
//       importance: Importance.high,
//       priority: Priority.high,
//     );
//     const notificationDetails = NotificationDetails(android: androidDetails);
//
//     await notificationsPlugin.show(0, title, body, notificationDetails);
//   }
//
//   Future<void> fetchWeather(String cityName) async {
//     final apiKey = "cb03cbe1e18d2c33c247c5927959d639";
//     final url = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
//
//     setState(() {
//       isLoading = true;
//     });
//
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
//
//         // Show a notification for the weather update
//         showNotification("Weather Update for $city", "Condition: $weatherCondition, Temp: $temperature");
//       } else {
//         showError("City not found. Please try again.");
//       }
//     } catch (e) {
//       showError("An error occurred. Please check your connection.");
//     }
//   }
//
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
//
//   // Display error message
//   void showError(String message) {
//     setState(() {
//       isLoading = false;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Weather App"),
//         centerTitle: true,
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: "Enter city name",
//                 border: OutlineInputBorder(),
//                 filled: true,
//                 suffixIcon: Icon(Icons.search),
//               ),
//               onSubmitted: (value) {
//                 if (value.isNotEmpty) {
//                   fetchWeather(value);
//                 }
//               },
//             ),
//             SizedBox(height: 20),
//             if (isLoading)
//               CircularProgressIndicator()
//             else
//               Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       Text(
//                         weatherIcon,
//                         style: TextStyle(fontSize: 64),
//                       ),
//                       Text(
//                         city,
//                         style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         temperature,
//                         style: TextStyle(fontSize: 48, color: Colors.blueAccent),
//                       ),
//                       Text(
//                         weatherCondition,
//                         style: TextStyle(fontSize: 24, color: Colors.black54),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }





// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   String city = "Enter a city";
//   String temperature = "--°C";
//   String weatherCondition = "Unknown";
//   String weatherIcon = "❓";
//   int humidity = 0;
//   double windSpeed = 0.0;
//   bool isLoading = false;
//   List<Map<String, dynamic>> weeklyForecast = [];
//
//   Future<void> fetchWeather(String cityName) async {
//     final apiKey = "cb03cbe1e18d2c33c247c5927959d639";
//     final url =
//         "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
//     final forecastUrl =
//         "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey&units=metric";
//
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       final weatherResponse = await http.get(Uri.parse(url));
//       final forecastResponse = await http.get(Uri.parse(forecastUrl));
//
//       if (weatherResponse.statusCode == 200 &&
//           forecastResponse.statusCode == 200) {
//         final weatherData = json.decode(weatherResponse.body);
//         final forecastData = json.decode(forecastResponse.body);
//
//         setState(() {
//           city = weatherData['name'];
//           temperature = "${weatherData['main']['temp']}°C";
//           weatherCondition = weatherData['weather'][0]['description'];
//           weatherIcon = getWeatherIcon(weatherData['weather'][0]['icon']);
//           humidity = weatherData['main']['humidity'];
//           windSpeed = weatherData['wind']['speed'];
//
//           // Parse weekly forecast
//           weeklyForecast = forecastData['list']
//               .map<Map<String, dynamic>>((item) => {
//             'date': item['dt_txt'],
//             'temp': item['main']['temp'],
//             'icon': item['weather'][0]['icon'],
//           })
//               .toList();
//
//           isLoading = false;
//         });
//       } else {
//         showError("City not found. Please try again.");
//       }
//     } catch (e) {
//       showError("An error occurred. Please check your connection.");
//     }
//   }
//
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
//
//   void showError(String message) {
//     setState(() {
//       isLoading = false;
//     });
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   Widget buildForecastItem(Map<String, dynamic> forecast) {
//     return Card(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             forecast['date'].split(' ')[0], // Show only the date
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Text(
//             getWeatherIcon(forecast['icon']),
//             style: TextStyle(fontSize: 32),
//           ),
//           Text("${forecast['temp']}°C"),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Enhanced Weather App"),
//         centerTitle: true,
//         backgroundColor: Colors.blueAccent,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: () => fetchWeather(city),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: "Enter city name",
//                 border: OutlineInputBorder(),
//                 suffixIcon: Icon(Icons.search),
//               ),
//               onSubmitted: (value) {
//                 if (value.isNotEmpty) {
//                   fetchWeather(value);
//                 }
//               },
//             ),
//             SizedBox(height: 20),
//             if (isLoading)
//               CircularProgressIndicator()
//             else
//               Expanded(
//                 child: ListView(
//                   children: [
//                     Card(
//                       elevation: 4,
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           children: [
//                             Text(
//                               weatherIcon,
//                               style: TextStyle(fontSize: 64),
//                             ),
//                             Text(
//                               city,
//                               style: TextStyle(
//                                   fontSize: 32, fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               temperature,
//                               style: TextStyle(
//                                   fontSize: 48, color: Colors.blueAccent),
//                             ),
//                             Text(
//                               weatherCondition,
//                               style:
//                               TextStyle(fontSize: 24, color: Colors.black54),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Column(
//                                   children: [
//                                     Text("Humidity"),
//                                     Text("$humidity%"),
//                                   ],
//                                 ),
//                                 Column(
//                                   children: [
//                                     Text("Wind"),
//                                     Text("${windSpeed} m/s"),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       "Weekly Forecast",
//                       style:
//                       TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10),
//                     Container(
//                       height: 150,
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: weeklyForecast
//                             .map((forecast) => buildForecastItem(forecast))
//                             .toList(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }


//
//
//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   String city = "Enter a city";
//   String temperature = "--°C";
//   String weatherCondition = "Unknown";
//   String weatherIcon = "❓";
//   int humidity = 0;
//   double windSpeed = 0.0;
//   bool isLoading = false;
//   List<Map<String, dynamic>> weeklyForecast = [];
//
//   @override
//   void initState() {
//     super.initState();
//     loadLastCity(); // Load the last searched city on startup
//   }
//
//   Future<void> saveCityName(String cityName) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('last_city', cityName);
//   }
//
//   Future<void> loadLastCity() async {
//     final prefs = await SharedPreferences.getInstance();
//     final lastCity = prefs.getString('last_city') ?? "Enter a city";
//     setState(() {
//       city = lastCity;
//     });
//     if (lastCity != "Enter a city") {
//       fetchWeather(lastCity); // Fetch weather for the last city
//     }
//   }
//
//   Future<void> fetchWeather(String cityName) async {
//     final apiKey = "cb03cbe1e18d2c33c247c5927959d639";
//     final url =
//         "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
//     final forecastUrl =
//         "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey&units=metric";
//
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       final weatherResponse = await http.get(Uri.parse(url));
//       final forecastResponse = await http.get(Uri.parse(forecastUrl));
//
//       if (weatherResponse.statusCode == 200 &&
//           forecastResponse.statusCode == 200) {
//         final weatherData = json.decode(weatherResponse.body);
//         final forecastData = json.decode(forecastResponse.body);
//
//         setState(() {
//           city = weatherData['name'];
//           temperature = "${weatherData['main']['temp']}°C";
//           weatherCondition = weatherData['weather'][0]['description'];
//           weatherIcon = getWeatherIcon(weatherData['weather'][0]['icon']);
//           humidity = weatherData['main']['humidity'];
//           windSpeed = weatherData['wind']['speed'];
//
//           // Parse weekly forecast
//           weeklyForecast = forecastData['list']
//               .map<Map<String, dynamic>>((item) => {
//             'date': item['dt_txt'],
//             'temp': item['main']['temp'],
//             'icon': item['weather'][0]['icon'],
//           })
//               .toList();
//
//           isLoading = false;
//         });
//         saveCityName(cityName); // Save the searched city
//       } else {
//         showError("City not found. Please try again.");
//       }
//     } catch (e) {
//       showError("An error occurred. Please check your connection.");
//     }
//   }
//
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
//
//   void showError(String message) {
//     setState(() {
//       isLoading = false;
//     });
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   Widget buildForecastItem(Map<String, dynamic> forecast) {
//     return Card(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             forecast['date'].split(' ')[0], // Show only the date
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Text(
//             getWeatherIcon(forecast['icon']),
//             style: TextStyle(fontSize: 32),
//           ),
//           Text("${forecast['temp']}°C"),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Enhanced Weather App"),
//         centerTitle: true,
//         backgroundColor: Colors.blueAccent,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: () => fetchWeather(city),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: "Enter city name",
//                 border: OutlineInputBorder(),
//                 suffixIcon: Icon(Icons.search),
//               ),
//               onSubmitted: (value) {
//                 if (value.isNotEmpty) {
//                   fetchWeather(value);
//                 }
//               },
//             ),
//             SizedBox(height: 20),
//             if (isLoading)
//               CircularProgressIndicator()
//             else
//               Expanded(
//                 child: ListView(
//                   children: [
//                     Card(
//                       elevation: 4,
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           children: [
//                             Text(
//                               weatherIcon,
//                               style: TextStyle(fontSize: 64),
//                             ),
//                             Text(
//                               city,
//                               style: TextStyle(
//                                   fontSize: 32, fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               temperature,
//                               style: TextStyle(
//                                   fontSize: 48, color: Colors.blueAccent),
//                             ),
//                             Text(
//                               weatherCondition,
//                               style:
//                               TextStyle(fontSize: 24, color: Colors.black54),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Column(
//                                   children: [
//                                     Text("Humidity"),
//                                     Text("$humidity%"),
//                                   ],
//                                 ),
//                                 Column(
//                                   children: [
//                                     Text("Wind"),
//                                     Text("${windSpeed} m/s"),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       "Weekly Forecast",
//                       style:
//                       TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10),
//                     Container(
//                       height: 150,
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: weeklyForecast
//                             .map((forecast) => buildForecastItem(forecast))
//                             .toList(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }






//
//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   String city = "Enter a city";
//   String temperature = "--°C";
//   String weatherCondition = "Unknown";
//   String weatherIcon = "❓";
//   int humidity = 0;
//   double windSpeed = 0.0;
//   bool isLoading = false;
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );
//     loadLastCity();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Future<void> saveCityName(String cityName) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('last_city', cityName);
//   }
//
//   Future<void> loadLastCity() async {
//     final prefs = await SharedPreferences.getInstance();
//     final lastCity = prefs.getString('last_city') ?? "Enter a city";
//     setState(() {
//       city = lastCity;
//     });
//     if (lastCity != "Enter a city") {
//       fetchWeather(lastCity);
//     }
//   }
//
//   Future<void> fetchWeather(String cityName) async {
//     final apiKey = "cb03cbe1e18d2c33c247c5927959d639";
//     final url =
//         "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
//
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           city = data['name'];
//           temperature = "${data['main']['temp']}°C";
//           weatherCondition = data['weather'][0]['description'];
//           weatherIcon = getWeatherIcon(data['weather'][0]['icon']);
//           humidity = data['main']['humidity'];
//           windSpeed = data['wind']['speed'];
//           isLoading = false;
//           _controller.forward(from: 0); // Trigger animation
//         });
//         saveCityName(cityName);
//       } else {
//         showError("City not found. Please try again.");
//       }
//     } catch (e) {
//       showError("An error occurred. Please check your connection.");
//     }
//   }
//
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
//
//   void showError(String message) {
//     setState(() {
//       isLoading = false;
//     });
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Weather App"),
//         centerTitle: true,
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: AnimatedSwitcher(
//         duration: Duration(seconds: 1),
//         child: isLoading
//             ? Center(child: CircularProgressIndicator())
//             : Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               SlideTransition(
//                 position: Tween<Offset>(
//                   begin: Offset(-1, 0),
//                   end: Offset(0, 0),
//                 ).animate(_controller),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: "Enter city name",
//                     border: OutlineInputBorder(),
//                     suffixIcon: Icon(Icons.search),
//                   ),
//                   onSubmitted: (value) {
//                     if (value.isNotEmpty) {
//                       fetchWeather(value);
//                     }
//                   },
//                 ),
//               ),
//               SizedBox(height: 20),
//               ScaleTransition(
//                 scale: _controller,
//                 child: Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         Hero(
//                           tag: 'weatherIcon',
//                           child: Text(
//                             weatherIcon,
//                             style: TextStyle(fontSize: 64),
//                           ),
//                         ),
//                         Text(
//                           city,
//                           style: TextStyle(
//                             fontSize: 32,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           temperature,
//                           style: TextStyle(
//                             fontSize: 48,
//                             color: Colors.blueAccent,
//                           ),
//                         ),
//                         Text(
//                           weatherCondition,
//                           style: TextStyle(
//                             fontSize: 24,
//                             color: Colors.black54,
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Column(
//                               children: [
//                                 Text("Humidity"),
//                                 Text("$humidity%"),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Text("Wind Speed"),
//                                 Text("${windSpeed} m/s"),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   String city = "Enter a city";
//   String temperature = "--°C";
//   String weatherCondition = "Unknown";
//   String weatherIcon = "❓";
//   int humidity = 0;
//   double windSpeed = 0.0;
//   int pressure = 0;
//   int visibility = 0;
//   bool isLoading = false;
//   bool isDarkTheme = false;
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );
//     loadLastCity();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Future<void> saveCityName(String cityName) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('last_city', cityName);
//   }
//
//   Future<void> loadLastCity() async {
//     final prefs = await SharedPreferences.getInstance();
//     final lastCity = prefs.getString('last_city') ?? "Enter a city";
//     setState(() {
//       city = lastCity;
//     });
//     if (lastCity != "Enter a city") {
//       fetchWeather(lastCity);
//     }
//   }
//
//   Future<void> fetchWeather(String cityName) async {
//     final apiKey = "cb03cbe1e18d2c33c247c5927959d639";
//     final url =
//         "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
//
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           city = data['name'];
//           temperature = "${data['main']['temp']}°C";
//           weatherCondition = data['weather'][0]['description'];
//           weatherIcon = getWeatherIcon(data['weather'][0]['icon']);
//           humidity = data['main']['humidity'];
//           windSpeed = data['wind']['speed'];
//           pressure = data['main']['pressure'];
//           visibility = data['visibility'] ~/ 1000; // Convert meters to km
//           isLoading = false;
//           _controller.forward(from: 0); // Trigger animation
//         });
//         saveCityName(cityName);
//       } else {
//         print("Error: ${response.statusCode}, ${response.body}");
//         showError("City not found. Please try again.");
//       }
//     } catch (e) {
//       print("Error occurred: $e");
//       showError("An error occurred. Please check your connection.");
//     }
//   }
//
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
//
//   void showError(String message) {
//     setState(() {
//       isLoading = false;
//     });
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Weather App"),
//           actions: [
//             Switch(
//               value: isDarkTheme,
//               onChanged: (value) {
//                 setState(() {
//                   isDarkTheme = value;
//                 });
//               },
//             )
//           ],
//         ),
//         body: AnimatedSwitcher(
//           duration: Duration(seconds: 1),
//           child: isLoading
//               ? Center(
//             key: ValueKey('loading'),
//             child: CircularProgressIndicator(),
//           )
//               : Padding(
//             key: ValueKey('loaded'),
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: "Enter city name",
//                     border: OutlineInputBorder(),
//                     suffixIcon: Icon(Icons.search),
//                   ),
//                   onSubmitted: (value) {
//                     if (value.isNotEmpty) {
//                       fetchWeather(value);
//                     }
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 ScaleTransition(
//                   scale: _controller,
//                   child: Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         children: [
//                           Text(
//                             weatherIcon,
//                             style: TextStyle(fontSize: 64),
//                           ),
//                           Text(
//                             city,
//                             style: TextStyle(
//                               fontSize: 32,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             temperature,
//                             style: TextStyle(
//                               fontSize: 48,
//                               color: Colors.blueAccent,
//                             ),
//                           ),
//                           Text(
//                             weatherCondition,
//                             style: TextStyle(
//                               fontSize: 24,
//                               color: Colors.black54,
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                           Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Column(
//                                 children: [
//                                   Text("Humidity"),
//                                   Text("$humidity%"),
//                                 ],
//                               ),
//                               Column(
//                                 children: [
//                                   Text("Wind Speed"),
//                                   Text("${windSpeed} m/s"),
//                                 ],
//                               ),
//                               Column(
//                                 children: [
//                                   Text("Pressure"),
//                                   Text("$pressure hPa"),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   "Future Forecast",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       forecastCard("Mon", "☀️", "32°C"),
//                       forecastCard("Tue", "🌧️", "28°C"),
//                       forecastCard("Wed", "⛅", "30°C"),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget forecastCard(String day, String icon, String temp) {
//     return Card(
//       elevation: 4,
//       margin: EdgeInsets.symmetric(horizontal: 8),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(day),
//             Text(icon, style: TextStyle(fontSize: 32)),
//             Text(temp),
//           ],
//         ),
//       ),
//     );
//   }
// }








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
          title: Text("Weather App"),
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
