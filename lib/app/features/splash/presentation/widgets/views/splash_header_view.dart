import 'package:bistro/app/features/splash/presentation/routing/splash_routing.dart';
import 'package:bistro/app/global_widgets/app_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/values/app_dimensions.dart';
import 'splash_background_view.dart';

class SplashHeaderView extends ConsumerStatefulWidget {
  final int length;
  final String? target;

  const SplashHeaderView({
    super.key,
    required this.length,
     this.target,
  });

  @override
  ConsumerState<SplashHeaderView> createState() => _SplashHeaderViewState();
}

class _SplashHeaderViewState extends ConsumerState<SplashHeaderView> {
  @override
  void initState() {
    super.initState();

    // Navigate immediately — no artificial delay
    Future.delayed(Duration.zero, () {
      if (!mounted) return;

      final target = widget.target ?? 'menu'; // default to menu if null

      if (target == 'wifi') {
        context.splashToLogin(); // or splashToWifi() if you rename
      } else {
        context.splashToMain();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SplashBackgroundView(),
        Center(
          child: AppImageWidget(
            path: 'assets/images/Bistro_Logo.svg',
            width: 150,
          ),
        ),
      ],
    );
  }
}
