import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'dashboard.dart';
import 'bmi_calculator.dart';
import 'calculator.dart';
import 'length_conversion.dart';
import 'about.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/dashboard': (context) => Dashboard(),
        '/bmi': (context) => BMICalculator(),
        '/calculator': (context) => Calculator(),
        '/length_conversion': (context) => LengthConversionPage(),
        '/about': (context) => AboutPage(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
