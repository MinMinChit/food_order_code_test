import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_test/features/home/presentation/bloc/category/category_cubit.dart';
import 'package:food_order_test/features/home/presentation/bloc/menu/menu_cubit.dart';

import 'locator.dart';

class BlocRegister extends StatelessWidget {
  const BlocRegister({super.key, this.child});

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit(getIt())),
        BlocProvider(create: (context) => MenuCubit(getIt())),
      ],
      child: child ?? const Placeholder(),
    );
  }
}
