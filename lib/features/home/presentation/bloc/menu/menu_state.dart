part of 'menu_cubit.dart';

@immutable
sealed class MenuState {}

final class MenuInitial extends MenuState {}

final class MenuLoading extends MenuState {}

final class MenuSuccess extends MenuState {
  final List<MenuModel> menuList;
  MenuSuccess({required this.menuList});
}

final class MenuFail extends MenuState {
  final String message;
  MenuFail({required this.message});
}
