import 'package:firebase_prac/sign_up/sign_up_injection.dart';
import 'package:get_it/get_it.dart';

final GetIt injection = GetIt.instance;

void initAppDependencyTree(){
  injectSignUpDependencies(injection);
}