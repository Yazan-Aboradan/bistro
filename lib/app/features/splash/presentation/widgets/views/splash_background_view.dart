import 'package:bistro/app/global_widgets/app_image_widget.dart';
import 'package:flutter/material.dart';

class SplashBackgroundView extends StatelessWidget {
  const SplashBackgroundView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String imagePath;

    if (screenWidth < 500) {
      imagePath = 'assets/images/background_0_mobile.png';
    } else if (screenWidth < 1000) {
      imagePath = 'assets/images/background_0_ipad.png';
    } else {
      imagePath = 'assets/images/background_0_ipad.png';
    }
    return SizedBox.expand(
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
