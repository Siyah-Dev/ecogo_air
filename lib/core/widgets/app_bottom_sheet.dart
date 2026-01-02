import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget child;
  final String? title;
  final double? height;
  final bool showCloseIcon;

  const AppBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.height,
    this.showCloseIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4,
              width: 40,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            if (title != null || showCloseIcon)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  if (showCloseIcon)
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => context.pop(),
                    ),
                ],
              ),

            if (title != null) const SizedBox(height: 8),

         
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
