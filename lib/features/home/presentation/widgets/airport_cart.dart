import 'package:exogo/core/extensions/space_extensions.dart';
import 'package:exogo/core/theme/app_colors.dart';
import 'package:exogo/features/home/presentation/widgets/app_card.dart';
import 'package:flutter/material.dart';

class AirportCard extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final String title;
  final String subtitle;

  final void Function()? onTap;

  const AirportCard({
    super.key,
    this.icon,
    this.label,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AppCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Icon(icon, size: 40, color: AppColors.grey),
                ),

              12.w,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (label != null)
                      Text(
                        label!.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey,
                          letterSpacing: 0.8,
                        ),
                      ),

                    4.h,

                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    2.h,

                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 13, color: AppColors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
