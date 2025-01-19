

import 'Login.dart';
import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'ProductScreen.dart';
import 'cartPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      title: 'Organic App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CartPage(), // Sets the OrganicHomePage as the home screen
    );
  }
}