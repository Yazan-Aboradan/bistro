import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/auth_register_controller_provider.dart';

TextEditingController useRegisterPhoneNumber({
  required WidgetRef ref,
  String? initialText,
}) =>
    use(
      _RegisterPhoneNumberHook(
        ref: ref,
        initialText: initialText,
      ),
    );

class _RegisterPhoneNumberHook extends Hook<TextEditingController> {
  final WidgetRef ref;
  final String? initialText;

  const _RegisterPhoneNumberHook({
    required this.ref,
    required this.initialText,
  });

  @override
  HookState<TextEditingController, _RegisterPhoneNumberHook> createState() =>
      _RegisterPhoneNumberHookState();
}

class _RegisterPhoneNumberHookState
    extends HookState<TextEditingController, _RegisterPhoneNumberHook> {
  late final TextEditingController textEditingController;

  @override
  void initHook() {
    super.initHook();

    textEditingController = TextEditingController(
      text: hook.initialText,
    );

    textEditingController.addListener(
      listener,
    );
  }

  @override
  TextEditingController build(BuildContext context) =>
      textEditingController;

  @override
  void dispose() {
    textEditingController.removeListener(
      listener,
    );

    textEditingController.dispose();

    super.dispose();
  }

  void listener() {
    final registerController =
    hook.ref.read(authRegisterControllerProvider.notifier);

    registerController.updatePhoneNumber(
      value: textEditingController.text,
    );
  }
}
