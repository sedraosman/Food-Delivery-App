import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_theme.dart';
import 'package:food_app/feature/home/widgets/my_button.dart';
import 'package:food_app/service/payment_service.dart';

class PaymentDetails extends StatelessWidget {
  static const screenRout = '/payment_details';

  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;

    final orderId = routeArgument['orderId'];
    final totalPrice = routeArgument['oederCount'];
    final PaymentService paymentService = PaymentService();
    final cardName = TextEditingController();
 
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_forward),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: MyTextStyle.normalTitleText(size: 20),
                  ),
                  Text(
                    totalPrice.toString(),
                    style: MyTextStyle.normalTitleText(size: 15),
                  )
                ],
              ),
              Divider(),
              TextField(
                controller: cardName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Card Name',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Card Number',
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'CVV',
                        prefixIcon: Icon(Icons.credit_card),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'MY/YY',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              MyButton(
                onPressed: () {
                  paymentService.submitPayment(
                    context: context,
                    orderId: orderId,
                    cardName:cardName.text ,
                    paymentMethod: 'card',
                  );
                },
                title: 'SUBMIT PAYMENT',
              )
            ],
          ),
        ),
      ),
    );
  }
}