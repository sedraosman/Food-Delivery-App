import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_theme.dart';
import 'package:food_app/feature/home/view/product_details.dart';
import 'package:food_app/core/models/product_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;

  const ProductWidget({
    super.key,
    required this.product,
  });

  // final int id;
  // final String name;
  // final String image;
  // final double rating;
  // final int time;
  // final double price;

  // const ProductWidget({
  //   super.key, required this.name, required this.image, required this.rating, required this.time, required this.price, required this.id,
  // });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).pushNamed
        // (
        //   ProductDetails.screenRout,
        //   arguments: {
        //     "id":id,
        //     'name':name,
        //   }
        // );

        Navigator.pushNamed(
          context,
          ProductDetails.screenRout,
          arguments: {
            'product': product,
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: MyAppColor.primaryColor,
            width: 2,
          ),
          //color: Color.fromARGB(255, 244, 235, 230),
        ),
        child: Column(
          children: [
            SizedBox(height: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/${product.image}",
                height: 90,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 7),
            Text(
              product.name,
              style: MyTextStyle.smallTitleText(),
            ),
            SizedBox(height: 7),
            Row(
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
                Text('${product.time} min'),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '\$ ${product.price}',
                  style: MyTextStyle.normalTitleText(size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}