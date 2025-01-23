import 'package:seeku_bmi/utils/screen_util.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;

  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2), // Corrected method
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onPressed,
          child: Container(
            width: _getResponsiveSize(context),
            height: _getResponsiveSize(context),
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: iconColor ?? Colors.white,
              size: _getIconSize(context),
            ),
          ),
        ),
      ),
    );
  }

  double _getResponsiveSize(BuildContext context) {
    return ScreenUtil.responsiveFontSize(
      context,
      mobile: 40,
      tablet: 48,
      desktop: 54,
    );
  }

  double _getIconSize(BuildContext context) {
    return ScreenUtil.responsiveFontSize(
      context,
      mobile: 24,
      tablet: 28,
      desktop: 32,
    );
  }
}
