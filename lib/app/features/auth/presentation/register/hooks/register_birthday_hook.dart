import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/auth_register_controller_provider.dart';

TextEditingController useRegisterBirthday({
  required WidgetRef ref,
  DateTime? initialText,
}) =>
    use(
      _RegisterBirthdayHook(
        ref: ref,
        initialText: initialText,
      ),
    );

class _RegisterBirthdayHook extends Hook<TextEditingController> {
  final WidgetRef ref;
  final DateTime? initialText;

  const _RegisterBirthdayHook({
    required this.ref,
    required this.initialText,
  });

  @override
  HookState<TextEditingController, _RegisterBirthdayHook> createState() => _RegisterBirthdayHookState();
}

class _RegisterBirthdayHookState extends HookState<TextEditingController, _RegisterBirthdayHook> {
  late final TextEditingController textEditingController;

  @override
  void initHook() {
    super.initHook();

    final formattedDate = hook.initialText != null
        ? DateFormat('yyyy-MM-dd').format(hook.initialText!)
        : ''; // or null if you prefer

    textEditingController = TextEditingController(
      text: formattedDate,
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
    registerController.updateBirthday(
      value: DateTime.parse(textEditingController.text),
    );
  }
}
