import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipes/core/failure/firebase_failure.dart';
import 'package:food_recipes/features/favourites/data/models/favourites_model.dart';
import 'package:food_recipes/features/favourites/data/repos/favourites_recipe_repo.dart';

class FavouritesRecipeRepoImp extends FavouritesRecipeRepo {
  @override
  Future<Either<FirebaseDataFailure, void>> addToFavourites(
      FavouritesRecipeModel favouritesRecipeModel) async {
    try {
      final User currentUser = FirebaseAuth.instance.currentUser!;
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection("Favourites");

      DocumentReference docRef = collectionReference
          .doc(currentUser.uid)
          .collection("FavouritesItem")
          .doc(favouritesRecipeModel.idMeal);
      DocumentSnapshot snapshot = await docRef.get();
      if (snapshot.exists) {
        await docRef.delete();
        fetchFavourites();
        return (right(null));
      } else {
        await docRef.set(favouritesRecipeModel.toJson());
        fetchFavourites();
        return (right(null));
      }
    } catch (error) {
      return left(
        FirebaseFailure(error.toString()),
      );
    }
  }

  @override
  Future<Either<FirebaseDataFailure, List<FavouritesRecipeModel>>>
      fetchFavourites() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!;
      var documentSnapshot = await FirebaseFirestore.instance
          .collection("Favourites")
          .doc(currentUser.uid)
          .collection("FavouritesItem")
          .get();

      if (documentSnapshot.docs.isNotEmpty) {
        List<FavouritesRecipeModel> favourites =
            documentSnapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data();
          return FavouritesRecipeModel.fromJson(data);
        }).toList();
        return right(favourites);
      } else {
        return left(
          FirebaseFailure('No favorite recipes yet'),
        );
      }
    } catch (error) {
      return left(FirebaseFailure(error.toString()));
    }
  }
}
