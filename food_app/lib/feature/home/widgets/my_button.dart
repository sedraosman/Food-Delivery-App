import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_theme.dart' show MyAppColor;


class MyButton extends StatelessWidget {
  const MyButton({
    super.key, required this.onPressed, required this.title,
  });
final  VoidCallback  onPressed;
final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    height: 50,
    shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(10)
    ),
    minWidth:double.infinity ,
    color: MyAppColor.dividerColor,
    child: Text(title),
                );
  }
}
