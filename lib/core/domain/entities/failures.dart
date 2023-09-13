import 'package:equatable/equatable.dart';

 class Failure extends Equatable{
  @override
  List<Object?> get props => [];

  @override
    bool? get stringify => true;


}

class InternetFailure implements Failure{
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
