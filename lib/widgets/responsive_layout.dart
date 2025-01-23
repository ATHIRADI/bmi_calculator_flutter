import 'package:seeku_bmi/utils/screen_util.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (ScreenUtil.isDesktop(context)) {
      return desktop ?? mobile;
    } else if (ScreenUtil.isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}
