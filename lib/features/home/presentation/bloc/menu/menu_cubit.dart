import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_test/features/home/data/api_services/order_service.dart';
import 'package:food_order_test/features/home/data/models/menu_model.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final OrderService orderApi;
  MenuCubit(this.orderApi) : super(MenuInitial());

  List<MenuModel> menuList = [];
  Future getMenuByCategory(String category) async {
    emit(MenuLoading());
    orderApi.getMenuByCategory(category).then((value) {
      menuList = MenuModel.menuListModel(value['meals']);
      emit(MenuSuccess(
        menuList: menuList,
      ));
    }).catchError((e) {
      emit(MenuFail(message: e.toString()));
    });
  }
}
