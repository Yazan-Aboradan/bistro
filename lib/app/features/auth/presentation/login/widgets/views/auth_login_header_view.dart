import 'package:flutter/material.dart';

import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';

class AuthLoginHeaderView extends StatelessWidget {
  const AuthLoginHeaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextWidget(
      text: context.localizations.login,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: AppDimensions.fontSize24,
      ),
    );
  }
}
