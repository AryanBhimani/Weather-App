import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/SplashScreen/SplashScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather app',
      debugShowCheckedModeBanner: false,
      // home: const MyHomePage(title: 'Weather App Home Page'),
      home:SplashScreen(),
    );
  }
}