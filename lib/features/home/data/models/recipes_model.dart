
class RecipesModel {
  final List<RecipesMeal> meals;

  RecipesModel({
    required this.meals,
  });

  factory RecipesModel.fromJson(Map<String, dynamic> json) => RecipesModel(
    meals: List<RecipesMeal>.from(json["meals"].map((x) => RecipesMeal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}

class RecipesMeal {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  RecipesMeal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory RecipesMeal.fromJson(Map<String, dynamic> json) => RecipesMeal(
    strMeal: json["strMeal"],
    strMealThumb: json["strMealThumb"],
    idMeal: json["idMeal"],
  );

  Map<String, dynamic> toJson() => {
    "strMeal": strMeal,
    "strMealThumb": strMealThumb,
    "idMeal": idMeal,
  };
}
