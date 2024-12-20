// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:weatherapp/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}


// import 'package:flutter_test/flutter_test.dart';
// import 'package:weather_app/widgets/weather_widget.dart';
// import 'package:weather_app/models/weather_model.dart';

// void main() {
//   testWidgets('WeatherWidget displays weather information', (WidgetTester tester) async {
//     // Create a WeatherModel instance for testing
//     final weather = WeatherModel(
//       temperature: 25,
//       description: 'Clear sky',
//       humidity: 60,
//     );

//     // Build the WeatherWidget with the WeatherModel
//     await tester.pumpWidget(
//       MaterialApp(
//         home: Scaffold(
//           body: WeatherWidget(weather: weather),
//         ),
//       ),
//     );

//     // Verify that the temperature is displayed
//     expect(find.text('25°C'), findsOneWidget);
//     // Verify that the description is displayed
//     expect(find.text('Clear sky'), findsOneWidget);
//     // Verify that the humidity is displayed
//     expect(find.text('Humidity: 60%'), findsOneWidget);
//   });
// }