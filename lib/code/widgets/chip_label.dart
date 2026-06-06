import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ChipLabel extends StatelessWidget {
  final String text;
  final bool selected;

  const ChipLabel(
      this.text, {
        super.key,
        this.selected = false,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: selected ? AppColors.blue : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: selected ? AppColors.blue : AppColors.border,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : AppColors.text,
          fontWeight: selected ? FontWeight.w800 : FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}