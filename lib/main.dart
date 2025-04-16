import 'package:flutter/material.dart';

void main() {
  runApp(PhishSleuthApp());
}

class PhishSleuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhishSleuth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhishSleuth'),
      ),
      body: Center(
        child: Text(
          'Welcome to PhishSleuth!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}