import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:{{project_name}}/core/error/failures.dart';
import 'package:{{project_name}}/core/usecase/usecase.dart';
import 'package:{{project_name}}/features/authorization/domain/repositories/auth_repository.dart';

class LogInUseCase extends UseCase<bool, LogInParam> {
  LogInUseCase({required this.repository});

  final AuthRepository repository;

  @override
  Future<Either<Failure, bool>> call(LogInParam params) {
    return repository.logIn(params);
  }
}

class LogInParam extends Equatable {
  const LogInParam({
    required this.login,
    required this.password,
  });

  final String login;
  final String password;

  @override
  List<Object?> get props => [
        login,
        password,
      ];
}
