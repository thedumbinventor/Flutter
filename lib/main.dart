import 'package:flutter/material.dart';
import 'LoginHandler/LoginScreen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}

void main() {
    runApp(const MyApp());
}