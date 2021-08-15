import 'package:dartz/dartz.dart';
import 'package:mason_testing_ground/core/error/failures.dart';
import 'package:mason_testing_ground/features/authorization/domain/entities/token.dart';
import 'package:mason_testing_ground/features/authorization/domain/use_cases/log_in_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> saveToken(Token token);

  Future<Either<Failure, Token>> getToken();

  Future<Either<Failure, bool>> tokenExist();

  Future<Either<Failure, bool>> removeToken();

  Future<Either<Failure, bool>> logIn(LogInParam param);

  Future<Either<Failure, bool>> signOut();
}
