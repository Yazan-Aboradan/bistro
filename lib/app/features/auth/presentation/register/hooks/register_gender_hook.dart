import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/auth_register_controller_provider.dart';

TextEditingController useRegisterGender({
  required WidgetRef ref,
  String? initialText,
}) =>
    use(
      _RegisterGenderHook(
        ref: ref,
        initialText: initialText,
      ),
    );

class _RegisterGenderHook extends Hook<TextEditingController> {
  final WidgetRef ref;
  final String? initialText;

  const _RegisterGenderHook({
    required this.ref,
    required this.initialText,
  });

  @override
  HookState<TextEditingController, _RegisterGenderHook> createState() => _RegisterGenderHookState();
}

class _RegisterGenderHookState extends HookState<TextEditingController, _RegisterGenderHook> {
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
  TextEditingController build(BuildContext context) {
    return textEditingController;
  }

  @override
  void dispose() {
    textEditingController.removeListener(
      listener,
    );

    textEditingController.dispose();

    super.dispose();
  }

  void listener() {
    final registerController = hook.ref.read(
      authRegisterControllerProvider.notifier,
    );
    registerController.updateGender(
      value: textEditingController.text,
    );
  }
}
