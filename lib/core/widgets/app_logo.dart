import 'package:flutter/widgets.dart';

class AppLogo extends StatelessWidget {
  final double height;

  const AppLogo({super.key, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/ecogo.png',
      height: height,
      fit: BoxFit.contain,
    );
  }
}
