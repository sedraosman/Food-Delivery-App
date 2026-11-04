import 'package:flutter/material.dart';
import 'package:food_app/feature/home/view/home_view_page.dart';
import 'package:food_app/feature/home/view/location_view_page.dart';
import 'package:food_app/feature/home/view/payment_details.dart';
import 'package:food_app/feature/home/view/product_details.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      routes: {
        '/' :(ctx)=>HomeViewPage(),
       ProductDetails.screenRout: (ctx)=>ProductDetails(),
       LocationViewPage.screenRout: (ctx)=>LocationViewPage(),
       PaymentDetails.screenRout:(ctx)=>PaymentDetails()
      
      },
      
      );
  }
  
}

