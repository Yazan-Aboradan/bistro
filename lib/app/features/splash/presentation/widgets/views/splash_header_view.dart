import 'package:bistro/app/features/splash/presentation/routing/splash_routing.dart';
import 'package:bistro/app/features/splash/providers/startup_provider.dart'
    show startupProvider;
import 'package:bistro/app/global_widgets/app_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/values/app_dimensions.dart';
import 'splash_background_view.dart';

class SplashHeaderView extends ConsumerStatefulWidget {
  final int length;
  final String? target;

  const SplashHeaderView({super.key, required this.length, this.target});

  @override
  ConsumerState<SplashHeaderView> createState() => _SplashHeaderViewState();
}

class _SplashHeaderViewState extends ConsumerState<SplashHeaderView> {
  @override
  void initState() {
    super.initState();
    // Initialization is now handled via startupProvider in build()
  }

  bool _navigated = false;

  void _onStartupComplete() {
    if (!mounted || _navigated) return;
    _navigated = true;

    final target = widget.target ?? 'menu';

    if (target == 'wifi') {
      context.splashToLogin();
    } else {
      context.splashToMain();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch startup status
    ref.listen(startupProvider, (previous, next) {
      if (next is AsyncData) {
        _onStartupComplete();
      }
    });

    // Handle case where it's already done
    final startupState = ref.watch(startupProvider);
    if (startupState.hasValue) {
      Future.microtask(() => _onStartupComplete());
    }

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
