import 'package:dio/dio.dart';
import 'package:mason_testing_ground/features/authorization/data/model/token.dart';
import 'package:mason_testing_ground/features/authorization/domain/entities/token.dart';
import 'package:mason_testing_ground/features/authorization/domain/use_cases/log_in_usecase.dart';

abstract class RemoteAuthDataSource {
  Future<Token> logIn(LogInParam param);
}

class RemoteAuthDataSourceImpl extends RemoteAuthDataSource {
  RemoteAuthDataSourceImpl({required this.source});

  final Dio source;

  @override
  Future<Token> logIn(LogInParam param) async {
    final response = await source.post(
      // TODO - replace with correct endpoint
      'login',
      data: {
        'username': param.login,
        'password': param.password,
      },
    );
    return TokenModel(
      accessToken: response.data['token'],
    );
  }
}
