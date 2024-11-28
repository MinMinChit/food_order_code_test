class MenuModel {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  MenuModel({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      strMeal: json['strMeal'] as String,
      strMealThumb: json['strMealThumb'] as String,
      idMeal: json['idMeal'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strMeal': strMeal,
      'strMealThumb': strMealThumb,
      'idMeal': idMeal,
    };
  }

  static List<MenuModel> menuListModel(dynamic result) {
    final parsed = result.cast<Map<String, dynamic>>();
    return parsed.map<MenuModel>((json) => MenuModel.fromJson(json)).toList();
  }
}
