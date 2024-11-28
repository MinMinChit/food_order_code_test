part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<CategoryModel> categoryList;
  final CategoryModel? selectedCategory;
  CategorySuccess({
    required this.categoryList,
    required this.selectedCategory,
  });
}

final class CategoryFail extends CategoryState {
  final String message;
  CategoryFail({required this.message});
}
