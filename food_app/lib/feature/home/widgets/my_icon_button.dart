import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_theme.dart' show MyAppColor;



class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key, required this.ontap, required this.icon,
  });
  final VoidCallback ontap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Expanded(
        child: Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(5),
           color: MyAppColor.primaryColor,
          ),
        child: Image.asset(icon),
        ),
      ),
    );
  }
}