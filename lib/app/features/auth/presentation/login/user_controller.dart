import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/storage/app_storage.dart';
import 'package:bistro/app/features/auth/presentation/register/routing/auth_register_routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/user_error_provider.dart';
import 'ui/user_ui_state.dart';

class UserController extends AutoDisposeNotifier<UserUiState> {
  @override
  UserUiState build() {
    // Load from local storage at startup (on web too)
    final storage = AppStorage.getInstance();

    final phoneNumber = storage.read<String>(key: AppStorageKeys.phoneNumber, defaultValue: '');
    final firstName = storage.read<String>(key: AppStorageKeys.firstName, defaultValue: '');
    final lastName = storage.read<String>(key: AppStorageKeys.lastName, defaultValue: '');

    final gender = storage.read<String>(key: AppStorageKeys.gender, defaultValue: '');
    final countryCode = storage.read<String>(key: AppStorageKeys.countryCode, defaultValue: '');
    final language = storage.read<String>(key: AppStorageKeys.language, defaultValue: '');

    final birthdayStr = storage.read<String>(
      key: AppStorageKeys.birthday,
      defaultValue: DateTime(2000).toIso8601String(),
    );
    final birthday = DateTime.tryParse(birthdayStr) ?? DateTime(2000);
    return UserUiState(
      firstName: firstName,
      lastName: lastName,  // Read from storage if needed
      phoneNumber: phoneNumber,
      birthday: birthday,
      gender: gender,
      countryCode: countryCode,
      language: language,
    );
  }
    void updateFieldError(String field, String? error) {
    ref.read(userErrorProvider(field).notifier).state = error;
  }

  void validationNamePage(BuildContext context) {
    final firstName = state.firstName;
    final lastName = state.lastName;
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
        updateFieldError('firstNameAndLastName', context.localizations.pleaseOnlyUseOneLanguageForFields);
      }
      if (firstName.length < 2) {
        updateFieldError('firstName', context.localizations.pleaseEnterLongerFirstName);
      } else if (RegExp(r'[\u0600-\u06FF]').hasMatch(firstName) && RegExp(r'[a-zA-Z]').hasMatch(firstName)) {
        updateFieldError('firstName', context.localizations.pleaseOnlyUseOneLanguage);
      }
      if (lastName.length < 2) {
        updateFieldError('lastName', context.localizations.pleaseEnterLongerLastName);
      } else if (RegExp(r'[\u0600-\u06FF]').hasMatch(lastName) && RegExp(r'[a-zA-Z]').hasMatch(lastName)) {
        updateFieldError('lastName', context.localizations.pleaseOnlyUseOneLanguage);
      }
    }
  }

  void validationBirthdayPage(BuildContext context) {
    final birthday = state.birthday;
    if (birthday == DateTime(2000)) {
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

  void validationPhoneNumberPage(BuildContext context) {
    final phoneNumber = state.phoneNumber;

    if (phoneNumber.isNotEmpty && phoneNumber.length == 10) {
      context.registerToPrivacyAndPolicy();
      updateFieldError('phoneNumber', null);
    } else {
      if (phoneNumber.isEmpty) {
        updateFieldError('phoneNumber', context.localizations.pleaseFillINThisField);
      } else if (phoneNumber.length != 10) {
        updateFieldError('phoneNumber', context.localizations.checkYourNumber);
      }
    }
  }

  void updateUser(UserUiState newUser) {
    state = newUser;
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

    state = state.copyWith(
      phoneNumber: value,
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
  bool validateAllFields({
    required BuildContext context,
  }) {
    bool isValid = true;

    final firstName = state.firstName.trim();
    final lastName = state.lastName.trim();
    bool hasMixedLanguages = ((RegExp(r'[\u0600-\u06FF]').hasMatch(firstName) || RegExp(r'[\u0600-\u06FF]').hasMatch(lastName)) &&
        (RegExp(r'[a-zA-Z]').hasMatch(firstName) || RegExp(r'[a-zA-Z]').hasMatch(lastName)));

    if (firstName.length < 2) {
      updateFieldError('firstName', context.localizations.pleaseEnterLongerFirstName);
      isValid = false;
    } else if (RegExp(r'[\u0600-\u06FF]').hasMatch(firstName) && RegExp(r'[a-zA-Z]').hasMatch(firstName)) {
      updateFieldError('firstName', context.localizations.pleaseOnlyUseOneLanguage);
      isValid = false;
    } else {
      updateFieldError('firstName', null);
    }

    if (lastName.length < 2) {
      updateFieldError('lastName', context.localizations.pleaseEnterLongerLastName);
      isValid = false;
    } else if (RegExp(r'[\u0600-\u06FF]').hasMatch(lastName) && RegExp(r'[a-zA-Z]').hasMatch(lastName)) {
      updateFieldError('lastName', context.localizations.pleaseOnlyUseOneLanguage);
      isValid = false;
    } else {
      updateFieldError('lastName', null);
    }

    if (hasMixedLanguages) {
      updateFieldError('firstNameAndLastName', context.localizations.pleaseOnlyUseOneLanguageForFields);
      isValid = false;
    } else {
      updateFieldError('firstNameAndLastName', null);
    }

    // Validate Phone Number
    if (state.phoneNumber.isEmpty) {
      updateFieldError('phoneNumber', context.localizations.pleaseFillINThisField);
      isValid = false;
    } else if (state.phoneNumber.length < 7) {
      updateFieldError('phoneNumber', context.localizations.pleaseEnterAPhoneNumberThatMatchYourSelectedCountry);
      isValid = false;
    } else {
      updateFieldError('phoneNumber', null);
    }

    return isValid;
  }

}
