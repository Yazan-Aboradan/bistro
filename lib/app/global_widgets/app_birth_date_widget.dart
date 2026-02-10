import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnifiedBirthDateField extends StatefulWidget {
  const UnifiedBirthDateField({
    super.key,
  });

  @override
  State<UnifiedBirthDateField> createState() => _UnifiedBirthDateFieldState();
}

class _UnifiedBirthDateFieldState extends State<UnifiedBirthDateField> {
  final mmController = TextEditingController();
  final ddController = TextEditingController();
  final yyyyController = TextEditingController();

  final mmFocus = FocusNode();
  final ddFocus = FocusNode();
  final yyyyFocus = FocusNode();

  bool isMMFocused = false;
  bool isDDFocused = false;
  bool isYYYYFocused = false;

  @override
  void initState() {
    super.initState();

    mmFocus.addListener(() => setState(() => isMMFocused = mmFocus.hasFocus));
    ddFocus.addListener(() => setState(() => isDDFocused = ddFocus.hasFocus));
    yyyyFocus.addListener(() => setState(() => isYYYYFocused = yyyyFocus.hasFocus));
  }

  @override
  void dispose() {
    mmController.dispose();
    ddController.dispose();
    yyyyController.dispose();
    mmFocus.dispose();
    ddFocus.dispose();
    yyyyFocus.dispose();
    super.dispose();
  }

  Widget _buildSubField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hint,
    required int maxLength,
    required bool isFocused,
    required void Function(String) onChanged,
  }) {
    return SizedBox(
      width: maxLength >=4 ? 70 : 40,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          isCollapsed: true,
          counterText: '',
          // hide counter text
          hintText: hint,
          // always show hint inside each field
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: AppDimensions.gap12h),
        ),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppRowWidget(
      width: 200,
      backgroundColor: AppColors.secondary,
      borderColor: AppColors.primary,
      children: [
        _buildSubField(
          controller: mmController,
          focusNode: mmFocus,
          hint: 'MM',
          maxLength: 2,
          isFocused: isMMFocused,
          onChanged: (val) {
            if (val.length == 2) FocusScope.of(context).requestFocus(ddFocus);
          },
        ),
        const Text('/', style: TextStyle(fontSize: 18)),
        _buildSubField(
          controller: ddController,
          focusNode: ddFocus,
          hint: 'DD',
          maxLength: 2,
          isFocused: isDDFocused,
          onChanged: (val) {
            if (val.length == 2) FocusScope.of(context).requestFocus(yyyyFocus);
          },
        ),
        const Text('/', style: TextStyle(fontSize: 18)),
        _buildSubField(
          controller: yyyyController,
          focusNode: yyyyFocus,
          hint: 'YYYY',
          maxLength: 4,
          isFocused: isYYYYFocused,
          onChanged: (val) {
            if (val.length == 4) yyyyFocus.unfocus();
          },
        ),
      ],
    );
  }
}
