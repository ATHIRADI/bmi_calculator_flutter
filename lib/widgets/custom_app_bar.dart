import 'package:seeku_bmi/utils/routes/app_routes.dart';
import 'package:seeku_bmi/widgets/adaptive_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AdaptiveText(
        title,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.setting);
          },
          icon: Icon(Icons.settings),
        )
      ],
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
