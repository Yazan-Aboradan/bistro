import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../auth_register_controller.dart';
import '../ui/register_ui_state.dart';

final authRegisterControllerProvider = NotifierProvider.autoDispose<RegisterController, RegisterUiState>(
  () {
    return RegisterController();
  },
);

