import 'package:dartz/dartz.dart';
import 'package:mason_testing_ground/core/error/failures.dart';
import 'package:mason_testing_ground/core/error/form_decoder.dart';
import 'package:mason_testing_ground/features/authorization/data/data_sources/local_auth_data_source.dart';
import 'package:mason_testing_ground/features/authorization/data/data_sources/remote_auth_data_source.dart';
import 'package:mason_testing_ground/features/authorization/domain/entities/token.dart';
import 'package:mason_testing_ground/features/authorization/domain/repositories/auth_repository.dart';
import 'package:mason_testing_ground/features/authorization/domain/use_cases/log_in_usecase.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final RemoteAuthDataSource remoteDataSource;
  final LocalAuthDataSource localDataSource;

  @override
  Future<Either<Failure, bool>> logIn(LogInParam param) async {
    try {
      final token = await remoteDataSource.logIn(param);
      final result = await localDataSource.saveToken(token);
      return Right(result);
    } catch (error) {
      return Left(handleError(error, DefaultLogInFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      final removeTokenResult = await localDataSource.removeToken();
      return Right(removeTokenResult);
    } catch (error) {
      return Left(handleError(error, DefaultSignOutFailure()));
    }
  }

  @override
  Future<Either<Failure, Token>> getToken() async {
    try {
      final token = localDataSource.getToken();
      return Right(token);
    } catch (error) {
      return Left(handleError(error, LocalAuthFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> removeToken() async {
    try {
      final removed = await localDataSource.removeToken();
      return Right(removed);
    } catch (error) {
      return Left(handleError(error, LocalAuthFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> saveToken(Token token) async {
    try {
      final saved = await localDataSource.saveToken(token);
      return Right(saved);
    } catch (error) {
      return Left(handleError(error, LocalAuthFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> tokenExist() async {
    try {
      final exists = localDataSource.tokenExist();
      return Right(exists);
    } catch (error) {
      return Left(handleError(error, LocalAuthFailure()));
    }
  }
}
