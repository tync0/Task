part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  final DioException? error;
  const AuthState({
    this.error,
  });
  @override
  List<Object?> get props => [error];
}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailed extends AuthState {
  const AuthFailed(DioException error) : super(error: error);

  @override
  List<Object> get props => [error!];
}
