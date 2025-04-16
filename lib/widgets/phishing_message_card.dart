import 'package:flutter/material.dart';

class PhishingMessageCard extends StatelessWidget {
  final String sender;
  final String message;

  PhishingMessageCard({required this.sender, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Icon(Icons.email),
        title: Text(sender),
        subtitle: Text(message),
      ),
    );
  }
}