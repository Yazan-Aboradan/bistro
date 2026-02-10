import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/features/auth/presentation/register/providers/auth_register_controller_provider.dart';
import 'package:bistro/app/features/main/routing/main_routing.dart';
import 'package:bistro/app/global_widgets/app_icon_widget.dart';
import 'package:bistro/l10n/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HeadersBackButtonView extends ConsumerWidget {
  final Color? color;
  final Function()? onClick;

  const HeadersBackButtonView({
    super.key,
    this.color,
    this.onClick,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final isLoading = ref.watch(
      authRegisterControllerProvider.select(
        (value) => value.isLoading,
      ),
    );
    return isLoading
        ? Gap(10)
        : AppIconWidget(
            iconData: Icons.keyboard_backspace,
            size: AppDimensions.iconSize30,
            onTap: onClick ??
                () {
                  context.toMain();
                },
            color: color ?? AppColors.primary,
          );
  }
}
