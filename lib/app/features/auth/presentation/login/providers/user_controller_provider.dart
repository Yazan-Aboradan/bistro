import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../user_controller.dart';
import '../ui/user_ui_state.dart';

final userControllerProvider = NotifierProvider.autoDispose<UserController, UserUiState>(
  () {
    return UserController();
  },
);
