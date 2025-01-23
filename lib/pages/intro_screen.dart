import 'package:seeku_bmi/generated/l10n.dart';
import 'package:seeku_bmi/utils/routes/app_routes.dart';
import 'package:seeku_bmi/utils/spacing.dart';
import 'package:seeku_bmi/widgets/adaptive_text.dart';
import 'package:seeku_bmi/widgets/custom_elevated_button.dart';
import 'package:seeku_bmi/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return Scaffold(
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(context),
        tablet: _buildTabletLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomElevatedButton(
          text: localization.getStartedButton,
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.bmiCalculator);
          },
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final localization = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacing.extraLargeVertical,
        AdaptiveText(
          localization.introTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge,
          mobileSize: 30,
          tabletSize: 35,
          desktopSize: 40,
        ),
        Spacing.extraLargeVertical,
        SizedBox(
          height: 250,
          width: double.infinity,
          child: Image.asset(
            "assets/images/intro_image.png",
            fit: BoxFit.contain,
          ),
        ),
        Spacing.extraLargeVertical, // Added extra spacing consistently
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AdaptiveText(
              localization.introSubtitle1,
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
              mobileSize: 22,
              tabletSize: 24,
              desktopSize: 26,
            ),
            Spacing.mediumVertical,
            AdaptiveText(
              localization.introSubtitle2,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
              mobileSize: 16,
              tabletSize: 18,
              desktopSize: 20,
            ),
          ],
        ),
      ],
    );
  }
}
