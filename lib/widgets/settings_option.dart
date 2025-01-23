import 'package:flutter/material.dart';
import 'package:seeku_bmi/utils/screen_util.dart';
import 'package:seeku_bmi/widgets/adaptive_text.dart';
import 'package:seeku_bmi/widgets/reusable_bg_card.dart';

class SettingsOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SettingsOption({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ReusableBgCard(
      onTap: onTap,
      cardChild: Row(
        children: [
          Icon(
            icon,
            size: ScreenUtil.responsiveFontSize(context,
                mobile: 40, tablet: 48, desktop: 56),
            color: Colors.green,
          ),
          const SizedBox(width: 16),
          AdaptiveText(
            title,
            mobileSize: 16,
            tabletSize: 18,
            desktopSize: 20,
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward,
            color: Theme.of(context).iconTheme.color,
          ),
        ],
      ),
    );
  }
}
