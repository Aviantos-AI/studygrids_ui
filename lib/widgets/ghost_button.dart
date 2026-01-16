import 'package:flutter/material.dart';
import 'package:pie_study/widgets/app_colors.dart';

class GhostButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool small;

  const GhostButton({
    super.key,
    required this.label,
    required this.onTap,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.navy,
        side: const BorderSide(
          color: Color.fromRGBO(11, 59, 87, 0.08),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: small ? 12 : 16,
          vertical: small ? 8 : 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: small ? 13 : 14,
        ),
      ),
    );
  }
}
