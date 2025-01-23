import 'package:seeku_bmi/generated/l10n.dart';
import 'package:seeku_bmi/utils/bmi_calculator_util.dart';

import 'package:seeku_bmi/utils/providers/bmi_result_provider.dart';
import 'package:seeku_bmi/utils/routes/app_routes.dart';
import 'package:seeku_bmi/utils/spacing.dart';
import 'package:seeku_bmi/utils/screen_util.dart';
import 'package:seeku_bmi/widgets/adaptive_text.dart';
import 'package:seeku_bmi/widgets/custom_app_bar.dart';
import 'package:seeku_bmi/widgets/custom_elevated_button.dart';
import 'package:seeku_bmi/widgets/gender_selector.dart';
import 'package:seeku_bmi/widgets/responsive_layout.dart';
import 'package:seeku_bmi/widgets/reusable_bg_card.dart';
import 'package:flutter/material.dart';
import 'package:seeku_bmi/utils/bmi_range_parser.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart'; // Import the parser

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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

    _bannerAd?.load();
  }

  @override
  Widget build(BuildContext context) {
    final bmiResultProvider = Provider.of<BMIResultProvider>(context);

    // Check if the BMI result is null
    if (bmiResultProvider.bmiResult == null) {
      return Scaffold(
        appBar: const CustomAppBar(
          title: 'Your BMI Result',
          showBackButton: false,
        ),
        body: Center(
          child: AdaptiveText(
            S.of(context).invalidDataMessage,
            style: Theme.of(context).textTheme.displayMedium,
            mobileSize: 18,
            tabletSize: 20,
            desktopSize: 22,
          ),
        ),
      );
    }

    // Retrieve values from the provider
    final double bmiResult = bmiResultProvider.bmiResult!;
    final int weight = bmiResultProvider.weight!;
    final int height = bmiResultProvider.height!;
    final int age = bmiResultProvider.age!;
    final Gender gender = bmiResultProvider.gender!;

    final String bmiCategory =
        BMICalculatorUtil.getBMICategory(context, bmiResult);
    final Color bmiCategoryColor =
        BMICalculatorUtil.getBMICategoryColor(bmiResult);

    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).resultScreenTitle,
        showBackButton: false,
      ),
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(context, bmiResult, bmiCategory,
            bmiCategoryColor, weight, height, age, gender),
        tablet: _buildTabletLayout(context, bmiResult, bmiCategory,
            bmiCategoryColor, weight, height, age, gender),
        desktop: _buildDesktopLayout(context, bmiResult, bmiCategory,
            bmiCategoryColor, weight, height, age, gender),
      ),
      bottomNavigationBar: _buildCalculateButton(context),
    );
  }

  Widget _buildCalculateButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomElevatedButton(
        text: S.of(context).recalculateButton,
        onPressed: () => Navigator.pushReplacementNamed(
          context,
          AppRoutes.bmiCalculator,
        ),
      ),
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    double bmiResult,
    String bmiCategory,
    Color bmiCategoryColor,
    int weight,
    int height,
    int age,
    Gender gender,
  ) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: _buildContent(context, bmiResult, bmiCategory, bmiCategoryColor,
            weight, height, age, gender),
      ),
    );
  }

  Widget _buildTabletLayout(
    BuildContext context,
    double bmiResult,
    String bmiCategory,
    Color bmiCategoryColor,
    int weight,
    int height,
    int age,
    Gender gender,
  ) {
    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: _buildContent(context, bmiResult, bmiCategory,
                bmiCategoryColor, weight, height, age, gender),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    double bmiResult,
    String bmiCategory,
    Color bmiCategoryColor,
    int weight,
    int height,
    int age,
    Gender gender,
  ) {
    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
            child: _buildContent(context, bmiResult, bmiCategory,
                bmiCategoryColor, weight, height, age, gender),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    double bmiResult,
    String bmiCategory,
    Color bmiCategoryColor,
    int weight,
    int height,
    int age,
    Gender gender,
  ) {
    String healthyWeightRange =
        BMICalculatorUtil.calculateHealthyWeightRange(height, age, gender);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ReusableBgCard(
          heightFactor: null,
          cardChild: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacing.smallVertical,
              AdaptiveText(
                bmiResult.toStringAsFixed(1),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: bmiCategoryColor),
                mobileSize: 75,
                tabletSize: 85,
                desktopSize: 95,
              ),
              Spacing.smallVertical,
            ],
          ),
        ),
        Spacing.mediumVertical,
        ReusableBgCard(
          heightFactor: null,
          cardChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBMICategoryRow(
                context,
                S.of(context).underweight,
                '0-18.4', // Example range
                Colors.blue,
                bmiResult,
              ),
              _buildBMICategoryRow(
                context,
                S.of(context).normalWeight,
                '18.5-24.9', // Example range
                Colors.green,
                bmiResult,
              ),
              _buildBMICategoryRow(
                context,
                S.of(context).overweight,
                '25-29.9', // Example range
                Colors.orange,
                bmiResult,
              ),
              _buildBMICategoryRow(
                context,
                S.of(context).obesity,
                '30+', // Example range
                Colors.red,
                bmiResult,
              ),
            ],
          ),
        ),
        Spacing.mediumVertical,
        ReusableBgCard(
          heightFactor: null,
          cardChild: Row(
            children: [
              Icon(
                Icons.heart_broken,
                color: Colors.green,
                size: ScreenUtil.responsiveFontSize(
                  context,
                  mobile: 40,
                  tablet: 48,
                  desktop: 56,
                ),
                semanticLabel: 'Fitness Center Icon',
              ),
              Spacing.mediumHorizontal,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AdaptiveText(
                      S.of(context).healthyWeightRange,
                      mobileSize: 16,
                      tabletSize: 18,
                      desktopSize: 20,
                    ),
                    Spacing.smallVertical,
                    AdaptiveText(
                      healthyWeightRange,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                      mobileSize: 18,
                      tabletSize: 20,
                      desktopSize: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBMICategoryRow(
    BuildContext context,
    String category,
    String range,
    Color color,
    double bmiResult,
  ) {
    bool isCurrentCategory =
        BMIRangeParser.isBMIInRange(bmiResult, range, context);

    // Debugging output
    debugPrint(
        'Category: $category, Range: $range, BMI Result: $bmiResult, Is Current Category: $isCurrentCategory');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: isCurrentCategory ? 20 : 12,
            height: isCurrentCategory ? 20 : 12,
            decoration: BoxDecoration(
              color: isCurrentCategory ? color : color.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
          ),
          Spacing.mediumHorizontal,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdaptiveText(
                  category,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: isCurrentCategory
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isCurrentCategory
                            ? color
                            : Colors.black54, // Change color based on category
                      ),
                  mobileSize: 18,
                  tabletSize: 20,
                  desktopSize: 20,
                ),
                AdaptiveText(
                  range,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: isCurrentCategory
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color:
                            isCurrentCategory ? Colors.black87 : Colors.black54,
                      ),
                  mobileSize: 12,
                  tabletSize: 14,
                  desktopSize: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
