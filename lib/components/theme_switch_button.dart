import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rollz/controller/theme_provider.dart';

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return IconButton(
      onPressed: () {
        Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
      },
      icon: Icon(
        isLightMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
        color: isLightMode ? Colors.black : Colors.white,
      ),
    );
  }
}
