import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_recipes/core/failure/firebase_failure.dart';
import 'package:food_recipes/features/auth/data/models/user_model.dart';
import 'package:food_recipes/features/profile/data/repo/profile_repo.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepoImp extends ProfileRepo {
  @override
  Future<Either<FirebaseDataFailure, String>> uploadNewUserImage(
      {required XFile image}) async {
    try {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch.toString()}');
      UploadTask uploadTask = storageReference.putFile(File(image.path));
      String? imageUrl;
      await uploadTask.whenComplete(() async {
        imageUrl = await storageReference.getDownloadURL();
      });
      return right(imageUrl!);
    } catch (error) {
      return left(FirebaseFailure(error.toString()));
    }
  }

  @override
  Future<Either<FirebaseDataFailure, String>> updateUserData(
      {required UserModel userModel}) async {
    try {
      User user = FirebaseAuth.instance.currentUser!;
      await user.updateDisplayName(userModel.name);
      await user.updatePassword(userModel.password);
      await user.updatePhotoURL(userModel.image);
      await FirebaseFirestore.instance
          .collection('usersAccountData')
          .doc(user.uid)
          .update(userModel.toJson());
      print(" ??????????????????????????????????????????????????????????????????????????????????????????????????????????????");

      print(userModel.name + user.uid);
      return right('Updated Successfully');
    } catch (error) {
      print(error);
      return left(FirebaseFailure(error.toString()));
    }
  }

  @override
  Future<Either<FirebaseDataFailure,UserModel >> getUserData() async {
    try {
      User user = FirebaseAuth.instance.currentUser!;
      var response = await FirebaseFirestore.instance
          .collection('usersAccountData')
          .doc(user.uid)
          .get();

        UserModel userModel =UserModel.fromJson(response.data()!);
        return right(userModel);
    } catch (error) {
      return left(FirebaseFailure(error.toString()));
    }
  }

}
