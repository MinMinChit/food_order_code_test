import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_test/features/home/data/api_services/order_service.dart';
import 'package:food_order_test/features/home/data/models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final OrderService orderApi;
  CategoryCubit(this.orderApi) : super(CategoryInitial());

  CategoryModel? selectedCategory;
  List<CategoryModel> categoryList = [];
  Future getOrderCubit() async {
    emit(CategoryLoading());
    orderApi.getCategory().then((value) {
      categoryList = CategoryModel.categoryListModel(value['categories']);
      if (categoryList.isNotEmpty) {
        selectedCategory = categoryList[0];
      }
      emit(CategorySuccess(
        categoryList: categoryList,
        selectedCategory: selectedCategory,
      ));
    }).catchError((e) {
      emit(CategoryFail(message: e.toString()));
    });
  }

  selectCategory(CategoryModel categoryModel) {
    selectedCategory = categoryModel;
    emit(CategorySuccess(
      categoryList: categoryList,
      selectedCategory: selectedCategory,
    ));
  }
}
