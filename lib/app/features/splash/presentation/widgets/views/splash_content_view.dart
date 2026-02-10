// import 'package:flutter/material.dart';
//
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../../providers/splash_controller_provider.dart';
// import 'splash_header_view.dart';
//
// class SplashContentView extends ConsumerStatefulWidget {
//   final int length;
//
//   const SplashContentView({
//     super.key,
//     required this.length,
//   });
//
//   @override
//   ConsumerState<SplashContentView> createState() => _SplashContentViewState();
// }
//
// class _SplashContentViewState extends ConsumerState<SplashContentView> {
//   @override
//   void initState() {
//     super.initState();
//     final splashController = ref.read(splashControllerProvider);
//     splashController.handleSplashDelay(context, widget.length);
//   }
//
//   @override
//   Widget build(
//     BuildContext context,
//   ) {
//     // location logo
//     return SplashHeaderView();
//   }
//
//   @override
//   void dispose() {
//     // Code
//
//     super.dispose();
//   }
// }
