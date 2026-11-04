import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_theme.dart';


class Category extends StatelessWidget {
  const Category({
    super.key, required this.image, required this.name,
  });
    final String image;
    final String name; 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 120,
        width: 100,
        decoration: BoxDecoration(
          //color: Color.fromARGB(255, 244, 235, 230),
          border: Border.all(color:MyAppColor.primaryColor,
          width: 2
           ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: 
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(image,
      
                  height: 60,
                  width: 70,
                  fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10,),
                Text(name,style: MyTextStyle.normalTitleText(),),
      
              ],
            ),
            
      
      ),
    );
  }
}
