import 'package:flutter/material.dart';

import 'splash_content.dart';

class SplashPage extends StatelessWidget {
  final int length;
  final String? target;

  const SplashPage({
    super.key,
    this.length=2,
     this.target,
  });

  @override
  Widget build(BuildContext context) {
    return SplashContent(length: length,target:target);
  }
}
