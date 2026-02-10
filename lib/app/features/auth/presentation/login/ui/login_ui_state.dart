import 'package:flutter/foundation.dart' show immutable;

@immutable
class LoginUiState {
  final bool isLoading;
  final String phoneNumber;

  const LoginUiState({
    required this.isLoading,
    required this.phoneNumber,
  });

  const LoginUiState.defaultObject()
      : this(
          isLoading: false,
          phoneNumber: '',
        );

  LoginUiState copyWith({
    bool? isLoading,
    String? phoneNumber,
  }) =>
      LoginUiState(
        isLoading: isLoading ?? this.isLoading,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );
}
