import 'package:seeku_bmi/generated/l10n.dart';
import 'package:seeku_bmi/utils/screen_util.dart';
import 'package:seeku_bmi/utils/spacing.dart';
import 'package:seeku_bmi/widgets/adaptive_text.dart';
import 'package:seeku_bmi/widgets/language_selector.dart';
import 'package:seeku_bmi/widgets/responsive_layout.dart';
import 'package:seeku_bmi/widgets/reusable_bg_card.dart';
import 'package:seeku_bmi/widgets/settings_option.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            S.of(context).settingsTitle), // Add a title for the settings screen
      ),
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(context),
        tablet: _buildTabletLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
        ReusableBgCard(
          heightFactor: null,
          cardChild: Row(
            children: [
              Icon(
                Icons.language,
                color: Colors.green,
                size: ScreenUtil.responsiveFontSize(
                  context,
                  mobile: 40,
                  tablet: 48,
                  desktop: 56,
                ),
                semanticLabel: 'Language Icon',
              ),
              Spacing.mediumHorizontal,
              AdaptiveText(
                localization.languageLabel, // Use localized language label
                mobileSize: 16,
                tabletSize: 18,
                desktopSize: 20,
              ),
              Spacer(),
              LanguageSelector(),
            ],
          ),
        ),
        Spacing.mediumVertical,
        SettingsOption(
          title: localization
              .privacyPolicyLabel, // Use localized privacy policy label
          icon: Icons.privacy_tip,
          onTap: () {
            // Handle privacy policy tap
          },
        ),
        Spacing.mediumVertical,
        SettingsOption(
          title: localization.shareLabel, // Use localized share label
          icon: Icons.share,
          onTap: () {
            // Handle share tap
          },
        ),
        Spacing.mediumVertical,
        SettingsOption(
          title: localization.rateUsLabel, // Use localized rate us label
          icon: Icons.star,
          onTap: () {
            // Handle rate us tap
          },
        ),
        Spacing.mediumVertical,
        SettingsOption(
          title: localization.feedbackLabel, // Use localized feedback label
          icon: Icons.feedback,
          onTap: () {
            // Handle feedback tap
          },
        ),
      ],
    );
  }
}
