import 'package:flutter/material.dart';
import '../widgets/app_bottom_sheet.dart';

Future<void> showAppBottomSheet({
  required BuildContext context,
  required Widget child,
  String? title,
  double? height,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
    builder: (_) => AppBottomSheet(
      title: title,
      height: height ?? MediaQuery.of(context).size.height * 0.7,
      child: child,
    ),
  );
}
