import 'package:dartz/dartz.dart';
import 'package:mason_testing_ground/core/error/failures.dart';
import 'package:mason_testing_ground/core/usecase/usecase.dart';
import 'package:mason_testing_ground/features/authorization/domain/entities/token.dart';
import 'package:mason_testing_ground/features/authorization/domain/repositories/auth_repository.dart';

class GetTokenUseCase extends UseCase<Token, NoParams> {
  GetTokenUseCase({
    required this.repository,
  });

  final AuthRepository repository;

  @override
  Future<Either<Failure, Token>> call(NoParams params) async {
    return repository.getToken();
  }
}
