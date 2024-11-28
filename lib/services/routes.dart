import 'package:flutter/material.dart';
import 'package:food_order_test/features/home/presentation/screens/menu_screen.dart';
import 'package:food_order_test/features/home/presentation/screens/order_success.dart';
import 'package:food_order_test/features/home/presentation/screens/otp_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: MenuScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const MenuScreen();
      },
    ),
    GoRoute(
      path: OtpScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        final extraData = state.extra as Map<String, dynamic>?;
        String phoneNumber = extraData?['phoneNumber'];
        return OtpScreen(phoneNumber: phoneNumber);
      },
    ),
    GoRoute(
      path: OrderSuccessScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const OrderSuccessScreen();
      },
    ),
  ],
);
