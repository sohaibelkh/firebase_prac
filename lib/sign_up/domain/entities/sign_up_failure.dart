import 'package:firebase_prac/core/domain/entities/failures.dart';

class SignUpFailure implements Failure{

  final String message;

  SignUpFailure(this.message);

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}