import 'package:flutter/material.dart';
import 'package:food_app/core/models/product_model.dart';
import 'package:food_app/feature/home/widgets/product_widget.dart';

class GridItem extends StatelessWidget {
  //final homeData = HomeData();
  final List<ProductModel> products;
   GridItem({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return 
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
              gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1/8,
                mainAxisSpacing:10,
                crossAxisSpacing: 10 ,
                mainAxisExtent: 210) ,
                //homeData eskiden bu vardi
            children: products.map((product){
              return ProductWidget( 
                 product: product, );
            }).toList()
            
               ),
        
        );
  }
}
