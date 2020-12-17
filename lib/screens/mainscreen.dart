import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static String routeName = '/mainScreen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome '),),
      body: Center(
        child: Text('Main Screen '),
      ),
    );
  }
}
