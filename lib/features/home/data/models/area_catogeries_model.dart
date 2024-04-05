

class AreaCategoryModel {
  final List<Meal> meals;

  AreaCategoryModel({
    required this.meals,
  });

  factory AreaCategoryModel.fromJson(Map<String, dynamic> json) => AreaCategoryModel(
    meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}

class Meal {
  final String strArea;

  Meal({
    required this.strArea,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    strArea: json["strArea"],
  );

  Map<String, dynamic> toJson() => {
    "strArea": strArea,
  };
}
