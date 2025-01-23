import 'package:flutter/material.dart';
import 'package:seeku_bmi/widgets/gender_selector.dart';

class BMIResultProvider with ChangeNotifier {
  double? _bmiResult;
  int? _weight;
  int? _height;
  int? _age;
  Gender? _gender;
  String? _bmiCategory;

  // Getters
  double? get bmiResult => _bmiResult;
  int? get weight => _weight;
  int? get height => _height;
  int? get age => _age;
  Gender? get gender => _gender;
  String? get bmiCategory => _bmiCategory;

  // Setter method
  void setResult({
    required double bmiResult,
    required int weight,
    required int height,
    required int age,
    required Gender gender,
    required String bmiCategory,
  }) {
    _bmiResult = bmiResult;
    _weight = weight;
    _height = height;
    _age = age;
    _gender = gender;
    _bmiCategory = bmiCategory;
    notifyListeners();
  }

  // Optional clear method
  void clearResult() {
    _bmiResult = null;
    _weight = null;
    _height = null;
    _age = null;
    _gender = null;
    _bmiCategory = null;
    notifyListeners();
  }
}
