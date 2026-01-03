import 'package:exogo/core/theme/app_colors.dart';
import 'package:exogo/core/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.isAutoLeading = false, this.icon = Icons.menu, this.onPressed});
  final bool isAutoLeading;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      automaticallyImplyLeading: isAutoLeading,

      title: const AppLogo(height: 32),

      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(icon, color: AppColors.black),
            onPressed: () => onPressed != null
                ? onPressed!()
                : Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
