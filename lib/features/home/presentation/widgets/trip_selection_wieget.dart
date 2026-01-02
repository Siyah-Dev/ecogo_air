import 'package:exogo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TripTypeSelector extends StatelessWidget {
  final bool isOneWay;
  final ValueChanged<bool> onChanged;

  const TripTypeSelector({
    super.key,
    required this.isOneWay,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      selectedColor: AppColors.white,
      fillColor: AppColors.primaryBlue,
      isSelected: [isOneWay, !isOneWay],
      onPressed: (index) {},
      borderRadius: BorderRadius.circular(8),
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('ONE WAY'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('ROUND TRIP'),
        ),
      ],
    );
  }
}
