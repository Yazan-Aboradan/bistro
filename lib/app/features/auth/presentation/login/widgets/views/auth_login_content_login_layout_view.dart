import 'package:flutter/material.dart';

import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';

class AuthLoginContentAuthLoginLayoutView extends StatelessWidget {
  const AuthLoginContentAuthLoginLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextWidget(
      textAlign: TextAlign.center,
      text: context.localizations.welcomeEnterYourNumberToContinue,
      fontSize: AppDimensions.fontSize16,
      maxLines: 4,
    );
  }
}
