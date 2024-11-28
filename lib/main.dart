import 'package:flutter/material.dart';
import 'package:food_order_test/constants/color_style.dart';
import 'package:food_order_test/services/bloc_register.dart';
import 'package:food_order_test/services/locator.dart';
import 'package:food_order_test/services/routes.dart';

void main() {
  locator();
  runApp(const FoodOrderApp());
}

class FoodOrderApp extends StatelessWidget {
  const FoodOrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocRegister(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: KStyle.cBg1,
          appBarTheme: AppBarTheme(
            titleTextStyle: KStyle.tTitle.copyWith(
              color: KStyle.cWhite,
            ),
            iconTheme: IconThemeData(
              color: KStyle.cWhite,
            ),
            backgroundColor: KStyle.cRed,
            centerTitle: true,
          ),
          dialogBackgroundColor: KStyle.cWhite,
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: KStyle.cRed),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              backgroundColor: KStyle.cRed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
