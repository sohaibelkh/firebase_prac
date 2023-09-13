import 'package:firebase_prac/sign_up/data/data_source/sign_up_source.dart';
import 'package:firebase_prac/sign_up/data/repository_impl/sign_up_repository_impl.dart';
import 'package:firebase_prac/sign_up/domain/repository/sign_up_repository.dart';
import 'package:firebase_prac/sign_up/domain/use_case/sign_up_usecase.dart';
import 'package:firebase_prac/sign_up/ui/state/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void injectSignUpDependencies(GetIt injection) {
  injection.registerFactory<SignUpCubit>(
    () => SignUpCubit(
      injection(),
    ),
  );

  injection.registerFactory<SignUpUSeCase>(
    () => SignUpUSeCase(
      injection(),
    ),
  );

  injection.registerFactory<SignUpRepository>(
    () => SignUpRepositoryImpl(
      internetConnectionChecker: injection(),
      source: injection(),
    ),
  );

  injection.registerFactory<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

  injection.registerFactory<SignUpSource>(
    () => SignUpSourceImpl(),
  );
}
