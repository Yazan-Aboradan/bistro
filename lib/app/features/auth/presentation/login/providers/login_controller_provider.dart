import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../auth_login_controller.dart';
import '../ui/login_ui_state.dart';

final authLoginControllerProvider = NotifierProvider.autoDispose<AuthLoginController, LoginUiState>(
  () {
    return AuthLoginController();
  },
);
