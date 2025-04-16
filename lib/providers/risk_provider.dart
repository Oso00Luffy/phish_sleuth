import 'package:flutter/material.dart';

class RiskProvider with ChangeNotifier {
  int _riskScore = 0;

  int get riskScore => _riskScore;

  void updateRiskScore(int score) {
    _riskScore = score;
    notifyListeners();
  }
}