import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'ui/login_ui_state.dart';

class AuthLoginController extends AutoDisposeNotifier<LoginUiState> {
  @override
  LoginUiState build() {
    ///region Lifecycle
    ///endregion Lifecycle

    return const LoginUiState.defaultObject();
  }

  ///region Lifecycle
  ///endregion Lifecycle

  ///region Events

  void updatePhoneNumber({
    required String value,
  }) {
    if (value == state.phoneNumber) {
      return;
    }

    state = state.copyWith(
      phoneNumber: value,
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
// --------------------login API ---------------------------------------//

// Future<void> login({
//   required void Function() onSuccess,
//   required void Function(
//     String message,
//   ) onError,
// }) async {
//   if (state.phoneNumber.isEmpty) {
//     onError(
//       'Please enter a valid phone number',
//     );
//
//   }
//
//   state = state.copyWith(
//     isLoading: true,
//   );
//
//   final useCase = ref.read(
//     authLoginUseCaseProvider,
//   );
//   final result = await useCase.call(
//     Params(
//       phoneNumber: state.phoneNumber,
//     ),
//   );
//
//   state = state.copyWith(
//     isLoading: false,
//   );
//
//   await result.fold(
//     (Failure failure) {
//       onError(
//         failure.message,
//       );
//     },
//     (AuthLogin data) async {
//       final authService = ref.read(
//         authServiceProvider,
//       );
//       authService.afterLoggedIn(
//         authLogin: data,
//       );
//
//       onSuccess();
//     },
//   );
// }

///endregion Events

///region Private Functions
///endregion Private Functions
