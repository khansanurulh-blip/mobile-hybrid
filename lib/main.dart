import 'package:flutter/material.dart';
import 'package:coffeeshop_app/welcome_page.dart';

void main() {
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget{
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Coffee Shop App",
      home: const WelcomePage(),
    );
  }
}