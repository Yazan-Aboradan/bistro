import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart';


@immutable
class UserUiState {
  final String firstName;
  final String lastName;
  final String gender;
  final DateTime birthday;
  final String phoneNumber;
  final String countryCode;
  final String language;

  const UserUiState({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthday,
    required this.phoneNumber,
    required this.countryCode,
    required this.language,
  });

  UserUiState.defaultObject()
      : this(
          firstName: '',
          lastName: '',
          gender: '',
          birthday: DateTime(2000),
          phoneNumber: '',
          countryCode: '',
          language: '',
        );

  UserUiState copyWith({
    String? firstName,
    String? lastName,
    String? gender,
    DateTime? birthday,
    String? phoneNumber,
    String? countryCode,
    String? language,
  }) {
    return UserUiState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryCode: countryCode ?? this.countryCode,
      language: language ?? this.language,
    );
  }
// UserUiState mapUserToUiState(User user) {
//   return UserUiState(
//     firstName: user.firstName,
//     lastName: user.lastName,
//     gender: user.gender,
//     birthday: user.birthday,
//     phoneNumber: user.phoneNumber,
//     countryCode: user.countryCode,
//       language:user.language
//   );
// }
}
