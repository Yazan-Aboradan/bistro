import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/auth_register_controller_provider.dart';

TextEditingController useRegisterFirstName({
  required WidgetRef ref,
  String? initialText,
}) =>
    use(
      _RegisterFirstNameHook(
        ref: ref,
        initialText: initialText,
      ),
    );

class _RegisterFirstNameHook extends Hook<TextEditingController> {
  final WidgetRef ref;
  final String? initialText;

  const _RegisterFirstNameHook({
    required this.ref,
    required this.initialText,
  });

  @override
  HookState<TextEditingController, _RegisterFirstNameHook> createState() => _RegisterFirstNameHookState();
}

class _RegisterFirstNameHookState extends HookState<TextEditingController, _RegisterFirstNameHook> {
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
    registerController.updateFirstName(
      value: textEditingController.text,
    );
  }
}
