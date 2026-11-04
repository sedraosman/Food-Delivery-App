import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_theme.dart' ;
class textList extends StatelessWidget {
  const textList({
    super.key, required this.icon, required this.title,
  });
final IconData icon;
final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,
      size: 30,
      color: MyAppColor.primaryColor,
      ),
      title: Text(title,
      style: 
      TextStyle(
        fontWeight: FontWeight.bold
      ),
      ),
      onTap:() {
        
      },
    );
  }
}