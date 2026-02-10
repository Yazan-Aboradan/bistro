import 'package:flutter/material.dart';

import 'app_icon_widget.dart';

class AppStarWidget extends StatelessWidget {
  final bool isRated;
  final Color color;

  const AppStarWidget({
    super.key,
    this.isRated = true,
    this.color = Colors.yellow,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return AppIconWidget(
      iconData: isRated ? Icons.star_rounded : Icons.star_border_rounded,
      color: color,
    );
  }
}
