import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/login_controller_provider.dart';

TextEditingController useLoginPhoneNumber({
  required WidgetRef ref,
  String? initialText,
}) =>
    use(
      _LoginPhoneNumberHook(
        ref: ref,
        initialText: initialText,
      ),
    );

class _LoginPhoneNumberHook extends Hook<TextEditingController> {
  final WidgetRef ref;
  final String? initialText;

  const _LoginPhoneNumberHook({
    required this.ref,
    required this.initialText,
  });

  @override
  HookState<TextEditingController, _LoginPhoneNumberHook> createState() => _LoginPhoneNumberHookState();
}

class _LoginPhoneNumberHookState extends HookState<TextEditingController, _LoginPhoneNumberHook> {
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
    final loginController = hook.ref.read(
      authLoginControllerProvider.notifier,
    );
    loginController.updatePhoneNumber(
      value: textEditingController.text,
    );
  }
}
