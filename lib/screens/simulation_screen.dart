import 'package:flutter/material.dart';
import '../widgets/phishing_message_card.dart';

class SimulationScreen extends StatelessWidget {
  final List<Map<String, String>> fakeMessages = [
    {
      'sender': 'Bank of America',
      'message': 'Your account has been locked. Click here to unlock.',
    },
    {
      'sender': 'Amazon',
      'message': 'Your package delivery failed. Update your address now.',
    },
    {
      'sender': 'PayPal',
      'message': 'Unusual activity detected. Verify your account immediately.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phishing Simulation'),
      ),
      body: ListView.builder(
        itemCount: fakeMessages.length,
        itemBuilder: (context, index) {
          return PhishingMessageCard(
            sender: fakeMessages[index]['sender']!,
            message: fakeMessages[index]['message']!,
          );
        },
      ),
    );
  }
}