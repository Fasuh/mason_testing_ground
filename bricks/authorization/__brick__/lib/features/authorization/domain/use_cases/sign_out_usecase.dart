import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/error/failures.dart';
import 'package:{{project_name}}/core/usecase/usecase.dart';
import 'package:{{project_name}}/features/authorization/domain/repositories/auth_repository.dart';

class SignOutUseCase extends UseCase<bool, NoParams> {
  SignOutUseCase({
    required this.repository,
  });

  final AuthRepository repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return repository.signOut();
  }
}