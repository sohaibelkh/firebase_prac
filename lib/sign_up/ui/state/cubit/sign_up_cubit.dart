
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_prac/sign_up/domain/use_case/sign_up_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.useCase) : super(SignUpInitial());

  final SignUpUSeCase useCase;

  Future<void> userSignUp(
      {required String email, required String password}) async {
    emit(SignUpLoading());
    final Either<String, String> uid =
        await useCase.execute(email: email, password: password);

    uid.fold(
      (String message) => emit(
        SignUpFailure(message),
      ),
      (String uid) => emit(
        SignUpSuccess(uid),
      ),
    );
  }
}
