import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_theme.dart' show MyAppColor;



class header extends StatelessWidget {
  const header({
    super.key, required this.image, required this.name,
  });
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
              ),
              SizedBox(width: 10,),
              Text(name,
              style: TextStyle(
                color: MyAppColor.subTitleText,
                fontSize: 30
              ),
              )
            ],
          ),
    );
  }
}