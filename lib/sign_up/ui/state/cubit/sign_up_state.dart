part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final String uid;

  const SignUpSuccess(this.uid);

  @override
  List<Object> get props => [uid];

  @override
  bool? get stringify => true;
}

final class SignUpFailure extends SignUpState {
  final String message;

  const SignUpFailure(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => true;
}
