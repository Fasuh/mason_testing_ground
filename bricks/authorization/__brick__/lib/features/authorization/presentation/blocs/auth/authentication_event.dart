part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckAuthenticationEvent extends AuthenticationEvent {}

class AuthenticationTimedOutEvent extends AuthenticationEvent {}

class AuthenticateEvent extends AuthenticationEvent {}

class UnAuthenticateEvent extends AuthenticationEvent {}
