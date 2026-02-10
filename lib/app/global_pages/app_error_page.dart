import 'package:flutter/material.dart';

class AppErrorPage extends StatelessWidget {
  final String message;

  const AppErrorPage({
    super.key,
    required this.message,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
          ),
        ),
      ),
    );
  }
}
