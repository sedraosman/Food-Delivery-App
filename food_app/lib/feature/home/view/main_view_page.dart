import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_theme.dart';
import 'package:food_app/feature/home/widgets/category.dart';
import 'package:food_app/feature/home/widgets/grid_item.dart';
import 'package:food_app/feature/home/widgets/header.dart';
import 'package:food_app/feature/home/widgets/my_icon_button.dart';
import 'package:food_app/feature/home/data/home_data.dart';
import 'package:food_app/service/product_service.dart';
import 'package:food_app/core/models/product_model.dart';

class MainViewPage extends StatefulWidget {
  @override
  State<MainViewPage> createState() => _MainViewPageState();
}

class _MainViewPageState extends State<MainViewPage> {
  final homeData = HomeData();
  final ProductService productService = ProductService();
  List<ProductModel> products = [];
  bool isLoading = true;

 
  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  // Future<void> loadProducts() async {
  //   final result = await productService.getProducts();

  //   setState(() {
  //     products = result;
  //     isLoading = false;
  //   });
  // }

  Future<void> loadProducts() async {
    try {
      final result = await productService.getProducts();

      print('PRODUCTS: $result');

      setState(() {
        products = result;
        isLoading = false;
      });
    } catch (e) {
      print('API ERROR: $e');

      setState(() {
        isLoading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_forward),
          ),
        ],
        title: header(
          image: 'assets/images/sed.png',
          name: 'sedra',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  MyIconButton(
                    ontap: () {},
                    icon: 'assets/icons/filter.png',
                  ),
                ],
              ),
            ),

            // Banner
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/pizza1.png',
                  width: 350,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 20),

            // Categories
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.topLeft,
              child: Text(
                'Select by Category',
                style: MyTextStyle.smallTitleText(),
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: homeData.categories.map((item) {
                  return Category(
                    image: item.image,
                    name: item.name,
                  );
                }).toList(),
              ),

              // Category(image: 'assets/images/meat.png', name: 'meat',),
              // SizedBox(width: 10,),
              // Category(image: 'assets/images/salad.png', name: 'meat',),
            ),

            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.topLeft,
              child: Text(
                'Popular menu items',
                style: MyTextStyle.smallTitleText(),
              ),
            ),

            // Product
            // GridItem(
            //   products: homeData.products,
            // ),

            isLoading
                ? const CircularProgressIndicator()
                : GridItem(products: products),
          ],
        ),
      ),
    );
  }
}