import 'package:flutter/material.dart';
import 'package:food_app/feature/home/widgets/textList.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text("Menu"),
          ),
          textList(icon:Icons.food_bank,title: 'restaurant',),
          textList(icon: Icons.pin_drop, title: 'order tracking'),
          textList(icon: Icons.category, title: 'category')
        ],
      ),
    );
  }
}
