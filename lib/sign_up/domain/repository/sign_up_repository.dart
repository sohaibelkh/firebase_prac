import 'package:dartz/dartz.dart';
import 'package:firebase_prac/core/domain/entities/failures.dart';

abstract class SignUpRepository{
  Future<Either<Failure, String>> userSignUp({required String email, required String password});
}