part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class AuthInput extends AuthEvent {
  final String? email, password;
  const AuthInput({this.email, this.password});

  @override
  List<Object?> get props => [email, password];
}
