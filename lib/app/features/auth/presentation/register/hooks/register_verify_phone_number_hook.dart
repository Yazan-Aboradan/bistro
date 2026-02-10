import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/auth_register_controller_provider.dart';

TextEditingController useRegisterVerifyPhoneNumber({
  required WidgetRef ref,
  String? initialText,
}) =>
    use(
      _RegisterVerifyPhoneNumberHook(
        ref: ref,
        initialText: initialText,
      ),
    );

class _RegisterVerifyPhoneNumberHook extends Hook<TextEditingController> {
  final WidgetRef ref;
  final String? initialText;

  const _RegisterVerifyPhoneNumberHook({
    required this.ref,
    required this.initialText,
  });

  @override
  HookState<TextEditingController, _RegisterVerifyPhoneNumberHook> createState() =>
      _RegisterVerifyPhoneNumberHookState();
}

class _RegisterVerifyPhoneNumberHookState
    extends HookState<TextEditingController, _RegisterVerifyPhoneNumberHook> {
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

    registerController.updateVerifyPhoneNumber(
      value: textEditingController.text,
    );
  }
}
