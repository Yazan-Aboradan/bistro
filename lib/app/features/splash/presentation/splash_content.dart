import 'package:bistro/app/features/splash/presentation/widgets/views/splash_header_view.dart';
import 'package:flutter/material.dart';

import 'widgets/views/splash_content_view.dart';

class SplashContent extends StatelessWidget {
  final int length;
  final String? target;


  const SplashContent({
    super.key,
    required this.length,
     this.target,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashHeaderView(
        length: length,
        target:target,
      ),
    );
  }
}
