import 'package:flutter/material.dart';
import 'screens/homescreen.dart';
import 'screens/mainscreen.dart';
import 'screens/loadingscreen.dart';


void main() => runApp(WomenApp());

class WomenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Women Safety App',
      home: LoadingScreen(),
      theme: ThemeData(
        primaryColor: Colors.pink[200],
      ),
      initialRoute: '/',
      routes: {
        MainPage.routeName : (context)=>MainPage(),
        HomeScreen.routeName :(context)=>HomeScreen(),

      },
    );
  }
}

