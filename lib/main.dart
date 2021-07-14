import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      theme: ThemeData(
          primaryColor: Colors.deepOrangeAccent,
          accentColor: Colors.deepOrangeAccent),
      home: SplashScreen(),
    );
  }
}
