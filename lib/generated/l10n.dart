// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Seeku \nBMI Calculator`
  String get introTitle {
    return Intl.message(
      'Seeku \nBMI Calculator',
      name: 'introTitle',
      desc: '',
      args: [],
    );
  }

  /// `Get Started with Tracking Your Health!`
  String get introSubtitle1 {
    return Intl.message(
      'Get Started with Tracking Your Health!',
      name: 'introSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Calculate your BMI and stay on top of your wellness journey, effortlessly.`
  String get introSubtitle2 {
    return Intl.message(
      'Calculate your BMI and stay on top of your wellness journey, effortlessly.',
      name: 'introSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStartedButton {
    return Intl.message(
      'Get Started',
      name: 'getStartedButton',
      desc: '',
      args: [],
    );
  }

  /// `Seeku - BMI Calculator`
  String get bmiCalculatorTitle {
    return Intl.message(
      'Seeku - BMI Calculator',
      name: 'bmiCalculatorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Calculate BMI`
  String get calculateBMILabel {
    return Intl.message(
      'Calculate BMI',
      name: 'calculateBMILabel',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Input`
  String get invalidInputTitle {
    return Intl.message(
      'Invalid Input',
      name: 'invalidInputTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please ensure:\n- Weight is between 0 and 500 kg\n- Height is a positive value\n- Age is between 1 and 120 years`
  String get invalidInputMessage {
    return Intl.message(
      'Please ensure:\n- Weight is between 0 and 500 kg\n- Height is a positive value\n- Age is between 1 and 120 years',
      name: 'invalidInputMessage',
      desc: '',
      args: [],
    );
  }

  /// `Weight (kg)`
  String get weightLabel {
    return Intl.message(
      'Weight (kg)',
      name: 'weightLabel',
      desc: '',
      args: [],
    );
  }

  /// `Age (years)`
  String get ageLabel {
    return Intl.message(
      'Age (years)',
      name: 'ageLabel',
      desc: '',
      args: [],
    );
  }

  /// `Your BMI Result`
  String get resultScreenTitle {
    return Intl.message(
      'Your BMI Result',
      name: 'resultScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Invalid data provided.`
  String get invalidDataMessage {
    return Intl.message(
      'Invalid data provided.',
      name: 'invalidDataMessage',
      desc: '',
      args: [],
    );
  }

  /// `Recalculate`
  String get recalculateButton {
    return Intl.message(
      'Recalculate',
      name: 'recalculateButton',
      desc: '',
      args: [],
    );
  }

  /// `Healthy Weight Range`
  String get healthyWeightRange {
    return Intl.message(
      'Healthy Weight Range',
      name: 'healthyWeightRange',
      desc: '',
      args: [],
    );
  }

  /// `Underweight`
  String get underweight {
    return Intl.message(
      'Underweight',
      name: 'underweight',
      desc: '',
      args: [],
    );
  }

  /// `Normal weight`
  String get normalWeight {
    return Intl.message(
      'Normal weight',
      name: 'normalWeight',
      desc: '',
      args: [],
    );
  }

  /// `Overweight`
  String get overweight {
    return Intl.message(
      'Overweight',
      name: 'overweight',
      desc: '',
      args: [],
    );
  }

  /// `Obesity`
  String get obesity {
    return Intl.message(
      'Obesity',
      name: 'obesity',
      desc: '',
      args: [],
    );
  }

  /// `BMI less than 18.5`
  String get underweightRange {
    return Intl.message(
      'BMI less than 18.5',
      name: 'underweightRange',
      desc: '',
      args: [],
    );
  }

  /// `BMI 18.5 to 24.9`
  String get normalWeightRange {
    return Intl.message(
      'BMI 18.5 to 24.9',
      name: 'normalWeightRange',
      desc: '',
      args: [],
    );
  }

  /// `BMI 25 to 29.9`
  String get overweightRange {
    return Intl.message(
      'BMI 25 to 29.9',
      name: 'overweightRange',
      desc: '',
      args: [],
    );
  }

  /// `BMI 30 and above`
  String get obesityRange {
    return Intl.message(
      'BMI 30 and above',
      name: 'obesityRange',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get heightLabel {
    return Intl.message(
      'Height',
      name: 'heightLabel',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get genderLabel {
    return Intl.message(
      'Gender',
      name: 'genderLabel',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get maleLabel {
    return Intl.message(
      'Male',
      name: 'maleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get femaleLabel {
    return Intl.message(
      'Female',
      name: 'femaleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get languageLabel {
    return Intl.message(
      'Language',
      name: 'languageLabel',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicyLabel {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicyLabel',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get shareLabel {
    return Intl.message(
      'Share',
      name: 'shareLabel',
      desc: '',
      args: [],
    );
  }

  /// `Rate Us`
  String get rateUsLabel {
    return Intl.message(
      'Rate Us',
      name: 'rateUsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedbackLabel {
    return Intl.message(
      'Feedback',
      name: 'feedbackLabel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'az'),
      Locale.fromSubtags(languageCode: 'bn'),
      Locale.fromSubtags(languageCode: 'cs'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'el'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fa'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'gu'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'hr'),
      Locale.fromSubtags(languageCode: 'hu'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'kn'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'ml'),
      Locale.fromSubtags(languageCode: 'mr'),
      Locale.fromSubtags(languageCode: 'my'),
      Locale.fromSubtags(languageCode: 'nl'),
      Locale.fromSubtags(languageCode: 'no'),
      Locale.fromSubtags(languageCode: 'or'),
      Locale.fromSubtags(languageCode: 'pa'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ro'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'sq'),
      Locale.fromSubtags(languageCode: 'sv'),
      Locale.fromSubtags(languageCode: 'ta'),
      Locale.fromSubtags(languageCode: 'te'),
      Locale.fromSubtags(languageCode: 'th'),
      Locale.fromSubtags(languageCode: 'tr'),
      Locale.fromSubtags(languageCode: 'uk'),
      Locale.fromSubtags(languageCode: 'ur'),
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
