import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/global_widgets/app_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/values/app_colors.dart';
import '../../core/values/app_dimensions.dart';
import '../../global_widgets/app_column_widget.dart';
import '../../global_widgets/app_text_widget.dart';

class MainWifiPage extends StatelessWidget {
  const MainWifiPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: AppColumnWidget(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/wifi.png',
            ),
            Gap(AppDimensions.gap30h),
            AppTextWidget(
              text: context.localizations.getThePassword.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: AppDimensions.fontSize14,
                color: AppColors.primary,
              ),
            ),
            Gap(AppDimensions.gap30h),
            AppButtonWidget(
              width: MediaQuery.of(context).size.width*3/4,
              height: AppDimensions.height40,
              text: context.localizations.next.toUpperCase(),
              backgroundColor: AppColors.primary,
              textColor: AppColors.secondary,
              onPressed: () {
                Future<void> openLink() async {
                  final appUrl = Uri.parse('http://192.168.88.1/free-internet.html'); // Replace with your Page ID
                  final webUrl = Uri.parse('http://192.168.88.1/free-internet.html');
                  if (await canLaunchUrl(appUrl)) {
                    await launchUrl(appUrl, mode: LaunchMode.externalApplication);
                  } else {
                    await launchUrl(webUrl, mode: LaunchMode.externalApplication);
                  }
                }

                openLink(); // Function you want
              },
            ),
          ],
        ),
      ),
    );
  }
}
