import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/db/AuthService.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService = AuthService();

  AuthCubit() : super(AuthInitial()) {
    _authService.authStateChanges.listen((user) {
      if (user != null) {
        emit(AuthSignedIn(user));
      } else {
        emit(AuthSignedOut());
      }
    });
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final user = await _authService.signInWithGoogle();
      if (user != null) {
        emit(AuthSignedIn(user));
      } else {
        emit(AuthSignInFailed('Sign in failed'));
      }
    } catch (e) {
      emit(AuthSignInFailed(e.toString()));
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    emit(AuthSignedOut());
  }
}
