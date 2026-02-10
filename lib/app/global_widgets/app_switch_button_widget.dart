import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class AppSwitchButtonWidget extends StatelessWidget {
  final void Function(
    String gender,
  )? onChanged;
  final String selectedGender; // Controlled from parent

  const AppSwitchButtonWidget({
    super.key,
    this.onChanged,
    required this.selectedGender,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMale = selectedGender.toLowerCase() == 'male';
    final bool isFemale = selectedGender.toLowerCase() == 'female';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.secondary),
      ),
      child: Row(
        children: [
          _buildGenderOption(
            icon: Icons.male,
            label: context.localizations.male,
            isSelected: isMale,
            onTap: () => onChanged?.call('male'),
            selectedColor: Colors.blue,
          ),
          _buildGenderOption(
            icon: Icons.female,
            label: context.localizations.female,
            isSelected: isFemale,
            onTap: () => onChanged?.call('female'),
            selectedColor: Colors.pink,
          ),
        ],
      ),
    );
  }

  Widget _buildGenderOption({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required Color selectedColor,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 6),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected ? selectedColor.withOpacity(0.15) : Colors.transparent,
            border: Border.all(
              color: isSelected ? selectedColor : Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? selectedColor : Colors.grey,
                size: 24,
              ),
              SizedBox(height: 6),
              AppTextWidget(
                text: label,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? selectedColor : Colors.grey,
                textAlign: TextAlign.center,
                style: const TextStyle(height: 1.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
