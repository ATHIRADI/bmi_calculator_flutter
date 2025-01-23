import 'package:seeku_bmi/generated/l10n.dart';
import 'package:flutter/material.dart';

class BMIRangeParser {
  static String determineCategory(double bmiResult, BuildContext context) {
    // Precise BMI category determination
    if (bmiResult < 18.5) {
      return S.of(context).underweight;
    } else if (bmiResult >= 18.5 && bmiResult < 25) {
      return S.of(context).normalWeight;
    } else if (bmiResult >= 25 && bmiResult < 30) {
      return S.of(context).overweight;
    } else {
      return S.of(context).obesity;
    }
  }

  static bool isBMIInRange(
      double bmiResult, String range, BuildContext context) {
    try {
      // Split the range into lower and upper bounds
      final parts = range.split('-');

      // Handle different range formats
      if (parts.length == 2) {
        // Standard range like '18.5-24.9'
        final double lowerBound = double.parse(parts[0]);
        final double upperBound =
            parts[1] == '+' ? double.infinity : double.parse(parts[1]);

        return bmiResult >= lowerBound &&
            (parts[1] == '+' || bmiResult <= upperBound);
      } else if (range.endsWith('+')) {
        // Handle ranges like '30+'
        final double lowerBound = double.parse(range.replaceAll('+', ''));
        return bmiResult >= lowerBound;
      }

      return false;
    } catch (e) {
      debugPrint('Error parsing BMI range: $e');
      return false;
    }
  }
}
