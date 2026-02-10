import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/global_widgets/app_button_widget.dart';
import '../../providers/auth_register_controller_provider.dart';

class AuthRegisterButtonView extends HookConsumerWidget {
  final void Function() onPressed;
  final String? text;

  const AuthRegisterButtonView({
    super.key,
    required this.onPressed,
    this.text,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Consumer(
      builder: (
        BuildContext context,
        WidgetRef ref,
        Widget? child,
      ) {
        final isLoading = ref.watch(
          authRegisterControllerProvider.select(
            (value) => value.isLoading,
          ),
        );

        if (isLoading) {
          return CircularProgressIndicator(
            color: AppColors.primary,
          );
        }

        return AppButtonWidget(
          width: double.infinity,
          height: AppDimensions.height45,
          textStyle: TextStyle(
            fontSize: AppDimensions.fontSize14,
            color: AppColors.secondary,
          ),
          backgroundColor: AppColors.primary,
          text: text ?? context.localizations.next,
          onPressed: () {
            onPressed();
            // final email = emailTextEditingController.text;

            // final loginController = ref.read(
            //   loginControllerProvider.notifier,
            // );
            // loginController.login(
            //   onSuccess: () {
            //     context.loginToNav(
            //       subPage: 'Main',
            //       email: email,
            //     );
            //   },
            //   onError: (
            //     String message,
            //   ) {
            //     ScaffoldMessenger.of(
            //       context,
            //     ).showSnackBar(
            //       SnackBar(
            //         content: AppTextWidget(
            //           text: message,
            //         ),
            //       ),
            //     );
            //   },
            // );
          },
        );
      },
    );
  }
}
