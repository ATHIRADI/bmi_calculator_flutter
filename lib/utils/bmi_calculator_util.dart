import 'package:seeku_bmi/generated/l10n.dart';
import 'package:seeku_bmi/widgets/gender_selector.dart';
import 'package:flutter/material.dart';

class BMICalculatorUtil {
  static double calculateBMI({
    required double weight,
    required double height,
    bool isMetric = true,
  }) {
    if (!isMetric) {
      weight = weight * 0.453592;
      height = height * 0.0254;
    }

    // Calculate BMI
    double bmi = weight / (height * height);
    return double.parse(bmi.toStringAsFixed(1));
  }

  static String getBMICategory(BuildContext context, double bmi) {
    if (bmi < 18.5) {
      debugPrint("Returning underweight in ${Localizations.localeOf(context)}");
      return S.of(context).underweight;
    }
    if (bmi >= 18.5 && bmi < 25) {
      debugPrint(
          "Returning normal weight in ${Localizations.localeOf(context)}");
      return S.of(context).normalWeight;
    }
    if (bmi >= 25 && bmi < 30) {
      debugPrint("Returning overweight in ${Localizations.localeOf(context)}");
      return S.of(context).overweight;
    }
    debugPrint("Returning obesity in ${Localizations.localeOf(context)}");
    return S.of(context).obesity;
  }

  static Color getBMICategoryColor(double bmi) {
    if (bmi < 18.5) return Colors.blue;
    if (bmi >= 18.5 && bmi < 25) return Colors.green;
    if (bmi >= 25 && bmi < 30) return Colors.orange;
    return Colors.red;
  }

  static String calculateHealthyWeightRange(
      int height, int age, Gender gender) {
    double heightInMeters = height / 100;

    double lowerWeight = 18.5 * (heightInMeters * heightInMeters);

    double upperWeight = 24.9 * (heightInMeters * heightInMeters);

    return '${lowerWeight.toStringAsFixed(1)} kg - ${upperWeight.toStringAsFixed(1)} kg';
  }
}
