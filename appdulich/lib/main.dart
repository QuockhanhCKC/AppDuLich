import 'package:appdulich/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: Colors.grey[200]),
    initialRoute: 'home',
    routes: {
      'home': (context) => MyHomePage(),
      //'login': (context) => LoginPage(),
    },
  ));
}
