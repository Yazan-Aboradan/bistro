import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/values/constants/app_urls.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../presentation/login/providers/login_error_provider.dart';
import '../presentation/register/providers/auth_register_error_provider.dart';
import 'entities/user.dart';

class AuthApis {
  Future<bool> registerUser(User user) async {
    final url = Uri.parse(AppUrls.registerUserUrl);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('✅ User registered successfully!');
        print(response.body);
        return true;
      } else {
        print('❌ Failed: ${response.statusCode}');
        print('Response: ${response.body}');
        return false;
      }
    } catch (e) {
      print('❌ Error during registration: $e');
      return false;
    }
  }

  Future<LoginResponse?> loginUser(String phoneNumber, WidgetRef ref, BuildContext context) async {
    final url = Uri.parse(AppUrls.loginUrl);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone_number': phoneNumber}),
      );

      if (response.statusCode == 200) {
        print('✅ Login successful!');
        ref.read(AuthLoginErrorProvider.notifier).state = null;
        return LoginResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        ;
      } else {
        ref.read(AuthLoginErrorProvider.notifier).state = context.localizations.loginErrorUserSide;
        print('❌ Login failed: ${response.statusCode}');
        print('Response: ${response.body}');
        return null;
      }
    } catch (e) {
      ref.read(AuthLoginErrorProvider.notifier).state = context.localizations.loginErrorServerSide;
      print('⚠️ Exception during login: $e');
      return null;
    }
  }

  Future<bool> validatePhoneNumber(String phoneNumber, WidgetRef ref, BuildContext context) async {
    final url = Uri.parse(AppUrls.validatePhoneUrl);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone_number': phoneNumber}),
      );

      if (response.statusCode == 200) {
        ref.read(authRegisterErrorProvider('registerServerSideError').notifier).state = null;
        ref.read(authRegisterErrorProvider('registerUserSideError').notifier).state = null;
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        if (data['valid'] == true) {
          print('✅ Phone number is available.');
          return true;
        } else {
          print('❌ Phone number already exists.');
          ref.read(authRegisterErrorProvider('registerUserSideError').notifier).state = context.localizations.registerUserSideError;

          return false;
        }
      } else {
        ref.read(authRegisterErrorProvider('registerServerSideError').notifier).state = context.localizations.registerServerSideError;
        print('❌ Validation failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      ref.read(authRegisterErrorProvider('registerServerSideError').notifier).state = context.localizations.registerServerSideError;
      print('❌ Error during phone number validation: $e');
      return false;
    }
  }
}

class LoginResponse {
  final String token;
  final User user;

  LoginResponse({required this.token, required this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }
}
