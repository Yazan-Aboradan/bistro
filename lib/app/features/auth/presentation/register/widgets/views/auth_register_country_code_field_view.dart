import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_country_code_down_list_widget.dart';
import 'package:bistro/app/global_widgets/app_row_widget.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/auth_register_controller_provider.dart';

class AuthRegisterCountryCodeFieldView extends HookConsumerWidget {
  final void Function(String) onChange;

  const AuthRegisterCountryCodeFieldView({
    super.key,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCode = ref.watch(
      authRegisterControllerProvider.select((state) => state.countryCode),
    );
    final controller = ref.read(authRegisterControllerProvider.notifier);

    return GestureDetector(
      onTap: () async {
          final selected = await showModalBottomSheet<String>(
            context: context,
            builder: (context) => AppCountryCodeDownListWidget(
              selectedCode: selectedCode,
            ),
          );
          if (selected != null && selected != selectedCode) {
            controller.updateCountryCode(value: selected);
            onChange(selected); // callback to parent
          }
        },
      child: AppRowWidget(
        height: 48,
        padding: [12, 12, 12, 12],
        backgroundColor: Colors.transparent,
        children: [
          selectedCode == 'SY'
              ? Image.asset(
            'assets/images/syria.jpg',
            width: 25,
            height: 15,
            fit: BoxFit.cover,
          )
              : Flag.fromString(
            selectedCode,
            width: 25,
            height: 15,
            fit: BoxFit.cover,
          ),
           Gap(AppDimensions.gap04w),
           Icon(Icons.arrow_drop_down,),
        ],
      ),
    );
  }
}
