import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/core/models/product_model.dart';
import 'package:food_app/feature/home/view/payment_details.dart';

class OrderService {
  Future<void> addOrder({
    required BuildContext context,
    required ProductModel product,
    required String customerName,
    required String city,
    required String address,
    required String phone,
    required String message,
    required int quantity,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2/food_api/add_order.php'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'product_id': product.id,
          'customer_name': customerName,
          'city': city,
          'address': address,
          'phone': phone,
          'message': message,
          'quantity': quantity,
          'total_price': product.price * quantity,
        }),
      );

      final result = jsonDecode(response.body);

      if (response.statusCode == 200 && result['success'] == true) {
        final orderId = int.parse(result['order_id'].toString());

        if (!context.mounted) return;

        Navigator.of(context).pushNamed(
          PaymentDetails.screenRout,
          arguments: {
            'orderId': orderId,
            'oederCount': product.price * quantity,
          },
        );
      } else {
  debugPrint('Status code: ${response.statusCode}');
  debugPrint('Response: ${response.body}');

  if (!context.mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Order failed: ${response.body}'),
    ),
  );
}
   } catch (e) {
  debugPrint('Order error: $e');

  if (!context.mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Order error: $e'),
    ),
  );
}
  }
}
