import 'package:bistro/app/routing/app_router_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension RegisterRouting on BuildContext {
  void registerToLogin() {
    return goNamed(
      AppRouterEnum.login.name,
    );
  }

  void registerToBirthDay()  {
    pushNamed(
      AppRouterEnum.birthDay.name,
    );
  }

  void registerToName()  {
    pushNamed(
      AppRouterEnum.namee.name,
    );
  }
  void registerToGender()  {
    pushNamed(
      AppRouterEnum.gender.name,
    );
  }

  Future<void> registerToPhoneNumber() async {
    pushNamed(
      AppRouterEnum.phoneNumber.name,
    );
  }
  Future<void> registerToPrivacyAndPolicy() async {
    pushNamed(
      AppRouterEnum.privacyAndPolicy.name,
    );
  }
}
