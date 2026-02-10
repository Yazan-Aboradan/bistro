import 'package:flutter/material.dart';

import 'auth_login_content.dart';

class AuthLoginPage extends StatelessWidget {
  const AuthLoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body:  AuthLoginContent(),
    );
  }
}
