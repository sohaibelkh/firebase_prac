import 'package:equatable/equatable.dart';

class SignUpException extends Equatable implements Exception {
  final String message;

  const SignUpException(this.message);

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}