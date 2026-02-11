import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/ui/theme/theme.dart';

class BlaButton extends StatelessWidget {
  final IconData? customIcon;
  final String customText;
  final bool isPrimary;
  final VoidCallback? onPressed;

  const BlaButton({
      super.key, 
      this.customIcon,
      required this.customText,
      required this.isPrimary,
      this.onPressed
    });

  Color get backgroundColor => isPrimary ? BlaColors.primary : BlaColors.white;
  Color get textColor => isPrimary ? BlaColors.white : BlaColors.primary;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      foregroundColor: textColor,
      backgroundColor: backgroundColor,
    );
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (customIcon != null) 
              Icon(customIcon),
            Text(customText),
          ]),
    );
  }
}
