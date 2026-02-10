
import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/features/auth/presentation/register/routing/auth_register_routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/auth_register_error_provider.dart';
import 'ui/register_ui_state.dart';

class RegisterController extends AutoDisposeNotifier<RegisterUiState> {
  @override
  RegisterUiState build() {
    ///region Lifecycle
    ///endregion Lifecycle

    return RegisterUiState.defaultObject();
  }

  void updateFieldError(String field, String? error) {
    ref.read(authRegisterErrorProvider(field).notifier).state = error;
  }

  void validationNamePage(BuildContext context) {
    final firstName = state.firstName.trim();
    final lastName = state.lastName.trim();
    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        lastName.length >= 2 &&
        lastName.length >= 2 &&
        !((RegExp(r'[\u0600-\u06FF]').hasMatch(firstName) || RegExp(r'[\u0600-\u06FF]').hasMatch(lastName)) &&
            (RegExp(r'[a-zA-Z]').hasMatch(firstName) || RegExp(r'[a-zA-Z]').hasMatch(lastName)))) {
      context.registerToBirthDay();
      updateFieldError('firstName', null);
      updateFieldError('lastName', null);
      updateFieldError('firstNameAndLastName', null);
    } else {
      if (((RegExp(r'[\u0600-\u06FF]').hasMatch(firstName) || RegExp(r'[\u0600-\u06FF]').hasMatch(lastName)) &&
          (RegExp(r'[a-zA-Z]').hasMatch(firstName) || RegExp(r'[a-zA-Z]').hasMatch(lastName)))) {
        updateFieldError('firstName', null);
        updateFieldError('lastName', null);
        updateFieldError('firstNameAndLastName', context.localizations.pleaseOnlyUseOneLanguage);
      }
      if (firstName.length < 2) {
        updateFieldError('firstName', context.localizations.pleaseEnterLongerFirstName);
      } else if (RegExp(r'[\u0600-\u06FF]').hasMatch(firstName) && RegExp(r'[a-zA-Z]').hasMatch(firstName)) {
        updateFieldError('firstNameAndLastName', context.localizations.pleaseOnlyUseOneLanguage);
      }
      if (lastName.length < 2) {
        updateFieldError('lastName', context.localizations.pleaseEnterLongerLastName);
      } else if (RegExp(r'[\u0600-\u06FF]').hasMatch(lastName) && RegExp(r'[a-zA-Z]').hasMatch(lastName)) {
        updateFieldError('firstNameAndLastName', context.localizations.pleaseOnlyUseOneLanguage);
      }
    }
  }

  void validationBirthdayPage(BuildContext context) {
    final birthday = state.birthday;
    if (birthday!=DateTime(2002)) {
      updateFieldError('birthday', null);
      context.registerToGender();
    } else {
      updateFieldError('birthday', context.localizations.pleaseCheckYourSelectedBirthday);
    }
  }

  void validationGenderPage(BuildContext context) {
    final gender = state.gender;
    if (gender.isNotEmpty) {
      updateFieldError('gender', null);
      context.registerToPhoneNumber();
    } else {
      updateFieldError('gender', context.localizations.pleaseSelectYourGender);
    }
  }

  bool validationPhoneNumberPage(BuildContext context) {
    final phoneNumber = state.phoneNumber;
    final verifyPhoneNumber = state.verifyPhoneNumber;

    if (phoneNumber.isNotEmpty && verifyPhoneNumber.isNotEmpty && phoneNumber == verifyPhoneNumber && phoneNumber.length >= 7) {
      updateFieldError('phoneNumber', null);
      updateFieldError('verifyPhoneNumber', null);
      updateFieldError('phoneNumberAndVerifyPhoneNumber', null);
      return true;
    } else {
      if (phoneNumber.length < 7) {
        updateFieldError('phoneNumber', context.localizations.pleaseEnterAPhoneNumberThatMatchYourSelectedCountry);
      }
      if (verifyPhoneNumber.isEmpty) {
        updateFieldError('verifyPhoneNumber', context.localizations.pleaseRepeatYourPhoneNumberToVerify);
      }

      if (phoneNumber != verifyPhoneNumber) {
        updateFieldError('phoneNumberAndVerifyPhoneNumber', context.localizations.noMatchingPhoneNumbers);
      }
    }
    return false;
  }

  void updateFirstName({
    required String value,
  }) {
    if (value == state.firstName) {
      return;
    }
    updateFieldError('firstName', null);
    updateFieldError('firstNameAndLastName', null);

    state = state.copyWith(
      firstName: value,
    );
  }

  void updateLastName({
    required String value,
  }) {
    if (value == state.lastName) {
      return;
    }
    updateFieldError('lastName', null);
    updateFieldError('firstNameAndLastName', null);
    state = state.copyWith(
      lastName: value,
    );
  }

  void updateBirthday({
    required DateTime value,
  }) {
    if (value == state.birthday) {
      return;
    }
    updateFieldError('birthDay', null);
    state = state.copyWith(
      birthday: value,
    );
  }

  void updateGender({
    required String value,
  }) {
    if (value == state.gender) {
      return;
    }
    updateFieldError('gender', null);

    state = state.copyWith(
      gender: value,
    );
  }

  void updateCountryCode({
    required String value,
  }) {
    if (value == state.countryCode) {
      return;
    }
    state = state.copyWith(
      countryCode: value,
    );
  }

  void updatePhoneNumber({
    required String value,
  }) {
    if (value == state.phoneNumber) {
      return;
    }
    updateFieldError('phoneNumber', null);
    updateFieldError('phoneNumberAndVerifyPhoneNumber', null);

    state = state.copyWith(
      phoneNumber: value,
    );
  }

  void updateVerifyPhoneNumber({
    required String value,
  }) {
    if (value == state.verifyPhoneNumber) {
      return;
    }
    updateFieldError('verifyPhoneNumber', null);
    updateFieldError('phoneNumberAndVerifyPhoneNumber', null);

    state = state.copyWith(
      verifyPhoneNumber: value,
    );
  }

  void updatePrivacyAndPolicyAgree({
    required bool value,
  }) {
    if (value == state.privacyAndPolicyAgree) {
      return;
    }

    state = state.copyWith(
      privacyAndPolicyAgree: value,
    );
  }

  void updateLanguage({
    required String value,
  }) {
    if (value == state.language) {
      return;
    }
    state = state.copyWith(
      language: value,
    );
  }
  void updateIsLoading({
    required bool value,
  }) {
    if (value == state.isLoading) {
      return;
    }
    state = state.copyWith(
      isLoading: value,
    );
  }
}
