import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/feature/auth/domain/usecase/auth_usecase.dart';

import '../../../../core/resource/datastate.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecaseImpl _authUsecaseImpl;

  AuthBloc(this._authUsecaseImpl) : super(AuthInitial()) {
    on<AuthInput>(
      (event, emit) async {
        emit(AuthLoading());
        final dataState = await _authUsecaseImpl.call(
          event.email!,
          event.password!,
        );
        if (dataState is DataSuccess) {
          emit(AuthSuccess());
        }
        if (dataState is DataFailed) {
          emit(AuthFailed(dataState.error!));
        }
      },
    );
  }
}
