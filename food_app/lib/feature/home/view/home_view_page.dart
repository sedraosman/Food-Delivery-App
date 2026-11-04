import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_theme.dart';
import 'package:food_app/feature/home/view/main_view_page.dart' show MainViewPage;
import 'package:food_app/feature/home/widgets/app_drawer.dart';
import 'package:food_app/feature/home/widgets/header.dart' show header;
import 'package:food_app/feature/home/widgets/my_button.dart' show MyButton;

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyAppColor.primaryColor,
        
      ),
      endDrawer: const AppDrawer(),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/images/main.png'),
            ),
            Container(
              child: Expanded(
                child: Stack(
                  children: [
                    Container(
                      color: MyAppColor.primaryColor,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                            'ORDER GREAT FOOD NEAR YOU WITH FOODIE!',
                            style: MyTextStyle.normalTitleText(
                              color: MyAppColor.titleBlackText,
                              size: 40,
                            ),
                          ),
                          SizedBox(height: 20),
                          MyButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainViewPage(),
                                ),
                              );
                            },
                            title: 'Start Ordering',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}