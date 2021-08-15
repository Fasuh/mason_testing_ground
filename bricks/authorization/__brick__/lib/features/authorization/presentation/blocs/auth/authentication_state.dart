part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class ErrorAuthenticationState extends AuthenticationState {
  ErrorAuthenticationState(this.failure);

  final Failure failure;

  @override
  List<Object> get props => [failure];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationTimedOutState extends AuthenticationUnauthenticated {}
