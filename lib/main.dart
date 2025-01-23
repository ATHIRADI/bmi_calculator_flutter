import 'dart:async';
import 'package:seeku_bmi/utils/providers/bmi_result_provider.dart';
import 'package:seeku_bmi/utils/providers/language_provider.dart';
import 'package:seeku_bmi/utils/routes/app_routes.dart';
import 'package:seeku_bmi/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/l10n.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => BMIResultProvider()),
      ],
      child: const MyBMICalculatorApp(),
    ),
  );
}

class MyBMICalculatorApp extends StatefulWidget {
  const MyBMICalculatorApp({super.key});

  @override
  State<MyBMICalculatorApp> createState() => _MyBMICalculatorAppState();
}

class _MyBMICalculatorAppState extends State<MyBMICalculatorApp> {
  Locale _locale = const Locale('en');

  @override
  void initState() {
    super.initState();
    _loadLanguage(); // Load the language when the app starts
  }

  Future<void> _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('selected_language');
    if (languageCode != null) {
      setState(() {
        _locale = Locale(languageCode);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Provider.of<LanguageProvider>(context)
          .currentLocale, // Use provider's locale
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.intro,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
