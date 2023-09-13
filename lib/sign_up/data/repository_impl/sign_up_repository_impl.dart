import 'package:dartz/dartz.dart';
import 'package:firebase_prac/core/domain/entities/failures.dart';
import 'package:firebase_prac/sign_up/data/data_source/sign_up_source.dart';
import 'package:firebase_prac/sign_up/data/models/exceptions.dart';
import 'package:firebase_prac/sign_up/domain/entities/sign_up_failure.dart';
import 'package:firebase_prac/sign_up/domain/repository/sign_up_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final InternetConnectionChecker internetConnectionChecker;
  final SignUpSource source;

  SignUpRepositoryImpl(
      {required this.internetConnectionChecker, required this.source});

  @override
  Future<Either<Failure, String>> userSignUp(
      {required String email, required String password}) async {
    final bool connected = await internetConnectionChecker.hasConnection;
    if (connected) {
      try {
        final String? uid =
            await source.userSignUp(email: email, password: password);
        return right(uid!);
      } on SignUpException catch (ex) {
        return left(
          SignUpFailure(ex.message),
        );
      }
    } else {
      return left(InternetFailure());
    }
  }
}
