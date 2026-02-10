import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class AuthLoginContentLogoView extends StatelessWidget {
  const AuthLoginContentLogoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/Bistro_logo.svg',
      width: AppDimensions.width100,
    );
  }
}
