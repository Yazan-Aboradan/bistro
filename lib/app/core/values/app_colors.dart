import 'package:flutter/material.dart';

abstract class AppColors {
  static const primary= Color(0xFF253F25);
  static const secondary= Color(0xffffffff);
  static const blur= Color(0xFF253F25);
  static const orange = Color(0xffe7831c);
  static const green = Color(0xff09964b);
  static const red = Color(0xff891820);
  static const defaultColor = Color.fromRGBO(233, 233 , 231, 1);
static const backgroundColor=Color(0xFFe9e9e7);

  static const primary01 =Color.fromRGBO(254, 248, 237, 1);
  static const secondary01=Color.fromRGBO(162, 78, 49, 1);
  static const primaryRipple = Color(0x88891820);
  static const primary1 = Colors.brown;
  static const primary2= Color(0xFF704214);
  static const primary3= Color(0xFFA66A39);
  static const primary4= Color(0xFFA26235);
  static const black01 = Color(0xFF000000);
  static const white01 = Color(0xFFFFFFFF);
  static const gray01 = Color(0xEEEEEEFF);
  static const gray02 = Color(0xEEB4B4BA);
  static const gray03 = Color(0x990A0202);
  static const gray04 = Color(0xFFCAC9C9);
  static const red01 = Color(0x93BD0909);
  static const green01 = Color(0x93076714);
  static const yellow01 = Color(0x93F8EF00);
  static const blue01 = Color(0x930051A8);
  static const pink01 = Color(0x93DE32DA);
  static const purple01 = Color(0x934E037C);

  static Color hoverColor = Colors.black.withOpacity(0.04);

  static const linearGradient01 = LinearGradient(
    colors: [
      secondary,
      primary
    ],
  );

  static const linearGradient02 = LinearGradient(
    begin: Alignment.bottomCenter,
    colors: [
      Colors.black87,
      Colors.black26,
      Colors.transparent,
    ],
    stops: [
      0,
      0.5,
      1.0,
    ],
  );
}
