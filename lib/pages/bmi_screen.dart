import 'package:seeku_bmi/generated/l10n.dart';
import 'package:seeku_bmi/utils/bmi_calculator_util.dart';
import 'package:seeku_bmi/utils/providers/bmi_result_provider.dart';
import 'package:seeku_bmi/utils/routes/app_routes.dart';
import 'package:seeku_bmi/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:seeku_bmi/widgets/adaptive_text.dart';
import 'package:seeku_bmi/widgets/responsive_layout.dart';
import 'package:seeku_bmi/widgets/custom_app_bar.dart';
import 'package:seeku_bmi/widgets/counter_card.dart';
import 'package:seeku_bmi/widgets/gender_selector.dart';
import 'package:seeku_bmi/widgets/height_slider.dart';
import 'package:seeku_bmi/utils/spacing.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  BMICalculatorScreenState createState() => BMICalculatorScreenState();
}

class BMICalculatorScreenState extends State<BMICalculatorScreen> {
  int _height = 170;
  int _weight = 70;
  int _age = 25;
  Gender _selectedGender = Gender.male;
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: '',
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          // Ad loaded successfully
          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
    );

    _bannerAd?.load(); // Start loading the ad
  }

  void _calculateBMI() {
    if (_weight > 0 &&
        _weight <= 500 &&
        _age >= 1 &&
        _age <= 120 &&
        _height > 0) {
      double heightInMeters = _height / 100;
      double bmiResult = BMICalculatorUtil.calculateBMI(
        weight: _weight.toDouble(),
        height: heightInMeters,
      );

      String bmiCategory = BMICalculatorUtil.getBMICategory(context, bmiResult);

      // Use Provider to set result
      Provider.of<BMIResultProvider>(context, listen: false).setResult(
        bmiResult: bmiResult,
        weight: _weight,
        height: _height,
        age: _age,
        gender: _selectedGender,
        bmiCategory: bmiCategory,
      );

      Navigator.pushReplacementNamed(context, AppRoutes.result);
    } else {
      _showInputErrorDialog();
    }
  }

  void _showInputErrorDialog() {
    final localization = S.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: AdaptiveText(localization.invalidInputTitle),
        content: AdaptiveText(localization.invalidInputMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: localization.bmiCalculatorTitle,
        showBackButton: false,
      ),
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(),
        tablet: _buildTabletLayout(),
        desktop: _buildDesktopLayout(),
      ),
      bottomNavigationBar: _buildCalculateButton(),
    );
  }

  Widget _buildCalculateButton() {
    final localization = S.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomElevatedButton(
        text: localization.calculateBMILabel,
        onPressed: _calculateBMI,
      ),
    );
  }

  Widget _buildMobileLayout() {
    return _buildContent(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    );
  }

  Widget _buildTabletLayout() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: _buildContent(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: _buildContent(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
        ),
      ),
    );
  }

  Widget _buildContent({EdgeInsets? padding}) {
    final localization = S.of(context);
    return Padding(
      padding: padding ?? EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CounterCard(
                  label: localization.weightLabel,
                  initialValue: _weight,
                  minValue: 0,
                  maxValue: 500,
                  onChanged: (value) {
                    setState(() {
                      _weight = value;
                    });
                  },
                ),
              ),
              Spacing.mediumHorizontal,
              Expanded(
                child: CounterCard(
                  label: localization.ageLabel,
                  initialValue: _age,
                  minValue: 1,
                  maxValue: 120,
                  onChanged: (value) {
                    setState(() {
                      _age = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Spacing.mediumVertical,
          HeightSlider(
            initialHeight: _height,
            minHeight: 50,
            maxHeight: 350,
            onChanged: (newHeight) {
              setState(() {
                _height = newHeight;
              });
            },
          ),
          Spacing.mediumVertical,
          GenderSelector(
            initialGender: _selectedGender,
            onGenderChanged: (gender) {
              setState(() {
                _selectedGender = gender;
              });
            },
          ),
          Spacing.mediumVertical,
          if (_bannerAd != null) // Check if the banner ad is loaded
            Container(
              alignment: Alignment.center, // Display the banner ad
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
        ],
      ),
    );
  }
}
