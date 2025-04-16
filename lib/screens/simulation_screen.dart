import 'package:flutter/material.dart';

class SimulationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simulation'),
      ),
      body: Center(
        child: Text(
          'Simulate phishing attacks here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}