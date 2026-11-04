import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/core/theme/app_theme.dart';

class PaymentService {
  Future<void> submitPayment({
    required BuildContext context,
    required int orderId,
    required String cardName,
    required String paymentMethod,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2/food_api/add_payment.php'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'order_id': orderId,
          'card_name':cardName,
          'payment_method': paymentMethod,
        }),
      );

      final result = jsonDecode(response.body);

      if (response.statusCode == 200 && result['success'] == true) {
        if (!context.mounted) return;

        showDialog(
          context: context,
          builder: (dialogContext) => Dialog(
            child: SizedBox(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 50,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Your order has been completed.',
                    style: MyTextStyle.normalTitleText(size: 15),
                  ),
                  const SizedBox(height: 10),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                    },
                    color: Colors.green.shade800,
                    child: const Text('Ok'),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        debugPrint('Payment error: ${response.body}');
      }
    } catch (e) {
      debugPrint('Payment connection error: $e');
    }
  }
}