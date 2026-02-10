import 'package:flutter/foundation.dart' show immutable, kDebugMode;
import 'package:flutter/material.dart';

@immutable
class RegisterUiState {
  final bool isLoading;
  final String firstName;
  final String lastName;
  final String gender;
  final DateTime birthday;
  final String phoneNumber;
  final String countryCode;
  final String verifyPhoneNumber;
  final String language;
  final bool privacyAndPolicyAgree;

  const RegisterUiState({
    required this.isLoading,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthday,
    required this.phoneNumber,
    required this.countryCode,
    required this.verifyPhoneNumber,
    required this.language,
    required this.privacyAndPolicyAgree,
  });

   RegisterUiState.defaultObject()
      : this(
    isLoading: false,
    firstName: '',
    lastName: '',
    gender: '',
    birthday: DateTime(2002),
    phoneNumber: '',
    countryCode: 'SY',
    verifyPhoneNumber: '',
    language: 'ar',
    privacyAndPolicyAgree: false,
  );

  RegisterUiState copyWith({
    bool? isLoading,
    String? firstName,
    String? lastName,
    String? gender,
    DateTime? birthday,
    String? phoneNumber,
    String? countryCode,
    String? verifyPhoneNumber,
    String? language,
    bool? privacyAndPolicyAgree,
    String? firstNameError,
  }) {
    return RegisterUiState(
      isLoading: isLoading ?? this.isLoading,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryCode: countryCode ?? this.countryCode,
      verifyPhoneNumber: verifyPhoneNumber ?? this.verifyPhoneNumber,
      language: language ?? this.language,
      privacyAndPolicyAgree: privacyAndPolicyAgree ?? this.privacyAndPolicyAgree,
    );
  }
}
