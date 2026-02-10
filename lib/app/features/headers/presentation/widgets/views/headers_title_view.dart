
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import 'package:bistro/app/global_widgets/app_text_widget.dart';

class HeadersTitleView extends ConsumerWidget {
  final String text;
  final Color? color;
  const HeadersTitleView({
    super.key,
    required this.text,
    this.color,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return AppTextWidget(
      text: text,
      style: TextStyle(
        fontFamily: 'GrandHotel',
        fontSize: 25,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
        color: color,
      ),
      maxLines: 1,
    );
  }
}
