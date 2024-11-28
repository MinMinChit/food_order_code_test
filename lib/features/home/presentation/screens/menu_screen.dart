import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_test/constants/color_style.dart';
import 'package:food_order_test/features/home/presentation/bloc/category/category_cubit.dart';
import 'package:food_order_test/features/home/presentation/widgets/menu_widget.dart';

import '../widgets/category_list.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  static const String routeName = '/';
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    context.read<CategoryCubit>().getOrderCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          Center(
            child: Text(
              'Welcome to Cheese O’Tea. ',
              style: KStyle.tTitle,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 155,
            padding: const EdgeInsets.symmetric(horizontal: 26),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: KStyle.cFaYellow,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  blurRadius: 4,
                  color: KStyle.cStroke,
                ),
              ],
              border: Border.all(
                color: KStyle.cStroke,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cheese\nO’ Tea', style: KStyle.tBannerText),
                Image.asset('assets/images/banner.png'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const CategoryList(),
          const SizedBox(height: 24),
          const MenuWidget(),
        ],
      ),
    );
  }
}
