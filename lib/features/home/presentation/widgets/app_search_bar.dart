import 'package:exogo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const AppSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: const InputDecoration(
          hintText: 'Search airport',
          prefixIcon: Icon(Icons.search, color: AppColors.black),
          border: InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
