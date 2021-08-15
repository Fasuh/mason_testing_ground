import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/error/failures.dart';
import 'package:{{project_name}}/core/usecase/usecase.dart';
import 'package:{{project_name}}/core/modules/any_animated_button/bloc/any_animated_button_bloc.dart';
import 'package:{{project_name}}/core/modules/any_animated_button/bloc/any_animated_button_event.dart';
import 'package:{{project_name}}/features/authorization/domain/use_cases/log_in_usecase.dart';
import 'package:{{project_name}}/features/authorization/presentation/blocs/auth/authentication_bloc.dart';
import 'package:{{project_name}}/features/authorization/presentation/blocs/login_bloc/login_parameters.dart';

class LoginBloc extends AnyAnimatedButtonBloc<LoginParameters, bool> {
  LoginBloc({
    required this.logInUseCase,
    required this.authenticationBloc,
  });

  final LogInUseCase logInUseCase;
  final AuthenticationBloc authenticationBloc;

  @override
  Future<Either<Failure, bool>> asyncAction(TriggerAnyAnimatedButtonEvent<LoginParameters> event) async {
    final result = await logInUseCase(LogInParam(
      login: event.object!.login,
      password: event.object!.password,
    ));
    authenticationBloc.add(CheckAuthenticationEvent());
    return result;
  }
}
