import 'package:flutter/material.dart';
import 'package:food_order_test/constants/color_style.dart';
import 'package:food_order_test/features/home/presentation/screens/menu_screen.dart';
import 'package:go_router/go_router.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  static String routeName = '/order-success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Success'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(),
          Image.asset('assets/images/success.png'),
          const SizedBox(height: 16),
          Text(
            'Your order is received.\nWe will contact you shortly.',
            textAlign: TextAlign.center,
            style: KStyle.tTextMain,
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 40,
            child: OutlinedButton(
              onPressed: () {
                context.go(MenuScreen.routeName);
              },
              child: Text(
                'BACK TO HOME',
                style: KStyle.tButton.copyWith(
                  color: KStyle.cRed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
