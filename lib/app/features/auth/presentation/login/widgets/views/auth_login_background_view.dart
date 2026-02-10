import 'package:bistro/app/global_widgets/app_image_widget.dart';
import 'package:flutter/material.dart';

class AuthLoginBackgroundView extends StatelessWidget {
  const AuthLoginBackgroundView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String imagePath;

    if (screenWidth < 550) {
      imagePath = 'assets/images/background_0_mobile.png';
    }  else {
      imagePath = 'assets/images/background_0_ipad.png';
    }
    return Image.asset(
      imagePath,
      width: screenWidth,
      height: screenHeight,
      fit: BoxFit.cover,
    );
  }
}
