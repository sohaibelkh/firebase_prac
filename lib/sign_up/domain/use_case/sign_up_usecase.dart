import 'package:dartz/dartz.dart';
import 'package:firebase_prac/core/domain/entities/failures.dart';
import 'package:firebase_prac/sign_up/domain/entities/sign_up_failure.dart';
import 'package:firebase_prac/sign_up/domain/repository/sign_up_repository.dart';

class SignUpUSeCase {
  final SignUpRepository repository;

  SignUpUSeCase(this.repository);

  Future<Either<String, String>> execute(
      {required String email, required String password}) async {
    final Either<Failure, String> uid =
        await repository.userSignUp(email: email, password: password);
    return uid.bimap(
      (Failure failure) {
        if (failure is InternetFailure) {
          return 'Internet Failure, please try again';
        } else if (failure is SignUpFailure) {
          return failure.message;
        }else {
          return "Unknown failure, please try again later";
        }
      },
      (String uid) => uid,
    );
  }
}
