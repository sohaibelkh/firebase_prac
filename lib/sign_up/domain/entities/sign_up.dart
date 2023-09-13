import 'package:equatable/equatable.dart';

class SignUp extends Equatable{

  final String email;
  final String password;
  final dynamic uid;

  const SignUp({required this.email, required this.password, required this.uid});



  @override
  List<Object?> get props => [email, password, uid];

  @override
  bool? get stringify => true;
}