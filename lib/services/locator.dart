import 'package:food_order_test/features/home/data/api_services/order_service.dart';
import 'package:food_order_test/features/home/presentation/bloc/category/category_cubit.dart';
import 'package:food_order_test/features/home/presentation/bloc/menu/menu_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void locator() {
  getIt.registerLazySingleton(() => OrderService());
  getIt.registerLazySingleton(() => CategoryCubit(getIt()));
  getIt.registerLazySingleton(() => MenuCubit(getIt()));
}
