import 'package:flutter/material.dart';
import 'package:food_app/core/models/product_model.dart';
import 'package:food_app/core/theme/app_theme.dart';
import 'package:food_app/feature/home/widgets/my_button.dart';
import 'package:food_app/service/order_service.dart';
//

class LocationViewPage extends StatefulWidget {
  static const screenRout = '/location';

  @override
  State<LocationViewPage> createState() => _LocationViewPageState();
}

class _LocationViewPageState extends State<LocationViewPage> {
  //const LocationViewPage({super.key});

  String selectLocation = 'Istanbul';
  int orderCount = 1;

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // final productId = routeArgument['id'];
    // //final title = routeArgument['title'];
    // final product = HomeData().products.firstWhere(
    //   (item) => item.id == productId,
    // );

    // new use for take information from db
    final ProductModel product = routeArgument['product'];
    final OrderService orderService = OrderService();

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("order :"),
              SizedBox(height: 5),
              Text(
                product.name,
                style: MyTextStyle.normalTitleText(size: 20),
              ),
              SizedBox(height: 5),
              Text('your name :'),
              SizedBox(height: 5),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 5),
              Text("City :"),
              SizedBox(height: 5),
              DropdownButtonFormField<String>(
                value: selectLocation,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 107, 107, 107),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 107, 107, 107),
                    ),
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    value: 'Istanbul',
                    child: Text('Istanbul'),
                  ),
                  DropdownMenuItem(
                    value: 'Ankara',
                    child: Text('Ankara'),
                  ),
                  DropdownMenuItem(
                    value: 'Izmir',
                    child: Text('Izmir'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectLocation = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              Text('add your aderes :'),
              SizedBox(height: 5),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Text('phone number :'),
              SizedBox(height: 5),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: '+5__ ___ __ __',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Text('your message :'),
              SizedBox(height: 5),
              TextField(
                controller: messageController,
                maxLines: null,
                minLines: 2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (orderCount > 1) {
                        setState(() {
                          orderCount--;
                        });
                      }
                    },
                    icon: Icon(Icons.remove),
                  ),
                  Text("$orderCount"),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        orderCount++;
                      });
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentGeometry.center,
                child: Text(
                  '\$${product.price * orderCount}',
                  style: MyTextStyle.normalTitleText(size: 20),
                ),
              ),
              SizedBox(height: 5),
              MyButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed(
                  //   PaymentDetails.screenRout,
                  //   arguments: {
                  //     "oederCount":product.price*orderCount,
                  //   }
                  // );

                  orderService.addOrder(
                    context: context,
                    product: product,
                    customerName: nameController.text,
                    city: selectLocation,
                    address: addressController.text,
                    phone: phoneController.text,
                    message: messageController.text,
                    quantity: orderCount,
                  );
                },
                title: 'pay',
              ),
            ],
          ),
        ),
      ),
    );
  }
}