import 'package:equatable/equatable.dart';

class LoginParameters extends Equatable {
  const LoginParameters({
    required this.login,
    required this.password,
  });

  final String login;
  final String password;

  LoginParameters copyWith({
    String? login,
    String? password,
  }) {
    return LoginParameters(
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
        login,
        password,
      ];
}
