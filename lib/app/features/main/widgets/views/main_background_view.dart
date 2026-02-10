import 'package:flutter/material.dart';

import 'package:bistro/app/global_widgets/app_image_widget.dart';

class MainBackgroundView extends StatelessWidget {
  const MainBackgroundView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String imagePath;

    if (screenWidth <= 550) {
      imagePath = 'assets/images/background_1_mobile.png';
    } else {
      imagePath = 'assets/images/background_1_ipad.png';
    }
    return SizedBox.expand(
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
