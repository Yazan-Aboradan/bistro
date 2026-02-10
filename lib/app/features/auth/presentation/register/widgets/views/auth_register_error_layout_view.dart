import 'package:bistro/app/core/values/app_dimensions.dart';

import 'package:bistro/app/global_widgets/app_row_widget.dart';

import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class RegisterErrorLayoutView extends StatelessWidget {
  final String text;

  const RegisterErrorLayoutView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppRowWidget(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Asterisk (*) aligned to the top
        Padding(
          padding:  EdgeInsets.only(top: 2), // Adjust for vertical alignment
          child: AppTextWidget(
            text: '*',
            color: Colors.red,
            fontSize: AppDimensions.fontSize14,
          ),
        ),

        const SizedBox(width: 4), // Spacing between * and text

        // Expanded label text to wrap under label only
        Expanded(
          child: AppTextWidget(
            text: text,
            color: Colors.red,
            maxLines: 4,
            fontSize: AppDimensions.fontSize14,
          ),
        ),
      ],
    );
  }
}

