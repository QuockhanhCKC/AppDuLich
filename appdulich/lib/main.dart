import 'package:appdulich/home.dart';
//import 'package:appdulich/map.dart';
import 'package:appdulich/restaurant_hotel.dart';
import 'package:appdulich/wellcome.dart';
import 'package:flutter/material.dart';
//import 'package:here_sdk/core.dart';

void main() {
  //SdkContext.init(IsolateOrigin.main);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        bottomAppBarColor: Colors.grey),
    initialRoute: 'wellcome',
    routes: {
      'home': (context) => MyHomePage(),
      'wellcome': (context) => WellcomePage(),
      //'map': (context) => MappPage(),
    },
  ));
}
