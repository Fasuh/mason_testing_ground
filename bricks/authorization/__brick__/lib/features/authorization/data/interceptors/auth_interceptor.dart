import 'dart:io';

import 'package:dio/dio.dart';
import 'package:{{project_name}}/core/usecase/usecase.dart';
import 'package:{{project_name}}/features/authorization/domain/use_cases/get_token_usecase.dart';
import 'package:{{project_name}}/features/authorization/domain/use_cases/remove_token_usecase.dart';
import 'package:{{project_name}}/features/authorization/domain/use_cases/token_exist_usecase.dart';
import 'package:{{project_name}}/features/authorization/presentation/blocs/auth/authentication_bloc.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.getTokenUseCase,
    required this.removeTokenUseCase,
    required this.tokenExistUseCase,
    required this.authenticationBloc,
  });

  final GetTokenUseCase getTokenUseCase;
  final RemoveTokenUseCase removeTokenUseCase;
  final TokenExistUseCase tokenExistUseCase;
  final AuthenticationBloc authenticationBloc;

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final existsResult = await tokenExistUseCase(NoParams());
    await existsResult.fold((error) {
      super.onRequest(options, handler);
    }, (data) async {
      if (data) {
        final tokenResult = await getTokenUseCase(NoParams());
        tokenResult.fold((error) {
          super.onRequest(options, handler);
        }, (data) {
          super.onRequest(options..headers[HttpHeaders.authorizationHeader] = 'bearer ${data.accessToken}', handler);
        });
      } else {
        super.onRequest(options, handler);
      }
    });
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err is DioError && (err.response?.statusCode == 401 || err.response?.statusCode == 403)) {
      await removeTokenUseCase(NoParams());
      authenticationBloc.add(CheckAuthenticationEvent());
    }
  }
}
