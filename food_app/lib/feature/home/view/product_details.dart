import 'package:flutter/material.dart';
import 'package:food_app/core/models/product_model.dart';
import 'package:food_app/core/theme/app_theme.dart';
//import 'package:food_app/feature/home/data/home_data.dart';
import 'package:food_app/feature/home/view/location_view_page.dart';
//import 'package:food_app/feature/home/view/location_view_page.dart';
import 'package:food_app/feature/home/widgets/my_button.dart';

class ProductDetails extends StatelessWidget {
  static const screenRout = '/product_details';

  ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // final productId = routeArgument['id'];
    // //final title = routeArgument['title'];
    // final product = HomeData().products.firstWhere(
    //   (item) => item.id == productId,
    // );

    final ProductModel product = routeArgument['product'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyAppColor.primaryColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: MyAppColor.primaryColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30),
              height: 600,
              width: 330,
              decoration: BoxDecoration(
                color: const Color.fromARGB(196, 239, 238, 221),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: MyTextStyle.normalTitleText(size: 30),
                        ),
                        Text(
                          '\$${product.price.toString()}',
                          style: MyTextStyle.normalTitleText(
                            color: MyAppColor.primaryColor,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/${product.image}",
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      product.description,
                      textAlign: TextAlign.center,
                      style: MyTextStyle.normalTitleText(size: 25),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: MyAppColor.dividerColor,
                      ),
                      Text('${product.rating}'),
                      SizedBox(width: 10),
                      Icon(
                        Icons.pin_drop,
                        color: MyAppColor.subTitleText,
                      ),
                      Text('${product.time}min'),
                    ],
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: MyButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          LocationViewPage.screenRout,
                          arguments: {
                            'product': product,
                          },
                        );
                      },
                      title: 'ORDER NOW',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}