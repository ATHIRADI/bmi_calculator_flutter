import 'package:seeku_bmi/generated/l10n.dart';
import 'package:seeku_bmi/utils/spacing_util.dart';
import 'package:flutter/material.dart';
import 'package:seeku_bmi/widgets/adaptive_text.dart';

class HeightSlider extends StatefulWidget {
  final int initialHeight;
  final int minHeight;
  final int maxHeight;
  final ValueChanged<int> onChanged;
  final Color? activeColor;
  final Color? inactiveColor;

  const HeightSlider({
    super.key,
    required this.initialHeight,
    this.minHeight = 120,
    this.maxHeight = 220,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  HeightSliderState createState() => HeightSliderState();
}

class HeightSliderState extends State<HeightSlider> {
  late double _currentHeight;

  @override
  void initState() {
    super.initState();
    _currentHeight = widget.initialHeight.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil.responsivePadding(context).horizontal,
        vertical: ScreenUtil.responsivePadding(context).vertical / 2,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(),
          _buildHeightDisplay(),
          _buildSlider(context),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return AdaptiveText(
      S.of(context).heightLabel, // Use localized height label
      mobileSize: 16,
      tabletSize: 18,
      desktopSize: 20,
    );
  }

  Widget _buildHeightDisplay() {
    return AdaptiveText(
      '${_currentHeight.round()} cm',
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
      mobileSize: 32,
      tabletSize: 36,
      desktopSize: 40,
    );
  }

  Widget _buildSlider(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor:
            widget.activeColor ?? Theme.of(context).colorScheme.secondary,
        inactiveTrackColor:
            widget.inactiveColor ?? Theme.of(context).primaryColor,
        thumbColor:
            widget.activeColor ?? Theme.of(context).colorScheme.secondary,
        overlayColor: (widget.activeColor ?? Theme.of(context).primaryColor)
            .withOpacity(0.2),
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: _getResponsiveThumbRadius(context),
        ),
        overlayShape: RoundSliderOverlayShape(
          overlayRadius: _getResponsiveThumbRadius(context) * 2,
        ),
      ),
      child: Slider(
        value: _currentHeight,
        min: widget.minHeight.toDouble(),
        max: widget.maxHeight.toDouble(),
        onChanged: (double newValue) {
          setState(() {
            _currentHeight = newValue;
            widget.onChanged(newValue.round());
          });
        },
        // Customize divisions for more precise control
        divisions: widget.maxHeight - widget.minHeight,
      ),
    );
  }

  double _getResponsiveThumbRadius(BuildContext context) {
    return ScreenUtil.responsiveFontSize(
      context,
      mobile: 10,
      tablet: 12,
      desktop: 14,
    );
  }
}
