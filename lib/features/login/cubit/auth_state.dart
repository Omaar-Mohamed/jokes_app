
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}

class AuthSignedIn extends AuthState {
  final User user;

  const AuthSignedIn(this.user);

  @override
  List<Object> get props => [user];
}

class AuthSignedOut extends AuthState {}

class AuthSignInFailed extends AuthState {
  final String message;

  const AuthSignInFailed(this.message);

  @override
  List<Object> get props => [message];
}
