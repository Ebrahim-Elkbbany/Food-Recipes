import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:food_recipes/features/auth/data/repos/signup_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignupRepoImpl extends SignupRepo{
  final FirebaseAuth auth;
  SignupRepoImpl(this.auth);
  @override
  Future<Either<String, UserCredential>> signupWithEmail({required String email, required String password,required String name})async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateDisplayName(name);
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
        return left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
        return left('The account already exists for that email.');
      }else{
        return left(e.code);
      }
    }catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, User>> signupWithGoogle() async{

      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if(googleUser == null){
          return const Left('No Email Selected');
        }
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        User? user = FirebaseAuth.instance.currentUser;
        return Right(user!);
      }  catch (e) {
        return  Left(e.toString());
      }
  }

}