import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/ui/theme/theme.dart';

class FormTile extends StatelessWidget {
  final IconData customIcon;
  final String? value;
  final String? hintText;
  final VoidCallback onTap;
  final Widget? trailing;

  const FormTile(
      {super.key,
      required this.customIcon,
      this.value,
      this.hintText,
      required this.onTap,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(customIcon),
      title: Text(value ?? hintText ?? "",
          style: TextStyle(
              color: value == null
                  ? BlaColors.neutralLight
                  : BlaColors.neutralDark)),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
