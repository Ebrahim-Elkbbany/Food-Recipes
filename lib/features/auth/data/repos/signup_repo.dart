import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignupRepo{
  Future<Either<String,UserCredential>> signupWithEmail({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<String,User>> signupWithGoogle();

}