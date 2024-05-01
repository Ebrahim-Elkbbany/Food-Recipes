import 'package:dartz/dartz.dart';
import 'package:food_recipes/core/failure/firebase_failure.dart';
import 'package:food_recipes/features/auth/data/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRepo {

  Future<Either<FirebaseDataFailure,String>> uploadNewUserImage({
    required XFile image,
  });

  Future<Either<FirebaseDataFailure, String>> updateUserData({
 required UserModel userModel
});

  Future<Either<FirebaseDataFailure,UserModel >> getUserData();



}
