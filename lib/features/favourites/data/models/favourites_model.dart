class FavouritesRecipeModel {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  FavouritesRecipeModel({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory FavouritesRecipeModel.fromJson(Map<String, dynamic> json) => FavouritesRecipeModel(
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