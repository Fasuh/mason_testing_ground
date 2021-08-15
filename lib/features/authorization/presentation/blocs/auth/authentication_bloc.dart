import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mason_testing_ground/core/error/failures.dart';
import 'package:mason_testing_ground/core/usecase/usecase.dart';
import 'package:mason_testing_ground/features/authorization/domain/use_cases/sign_out_usecase.dart';
import 'package:mason_testing_ground/features/authorization/domain/use_cases/token_exist_usecase.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required this.signOutUseCase,
    required this.tokenExistUseCase,
  }) : super(AuthenticationInitial());

  final SignOutUseCase signOutUseCase;
  final TokenExistUseCase tokenExistUseCase;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is UnAuthenticateEvent) {
      yield* _mapLogout(AuthenticationUnauthenticated());
    } else if (event is AuthenticationTimedOutEvent) {
      yield* _mapTimeOut();
    } else if (event is CheckAuthenticationEvent) {
      yield* _mapCheckAuthenticationEvent();
    }
  }

  Stream<AuthenticationState> _mapLogout(AuthenticationUnauthenticated state) async* {
    final removeCredentials = await signOutUseCase(NoParams());
    yield* removeCredentials.fold(
      (error) async* {
        yield ErrorAuthenticationState(error);
      },
      (data) async* {
        yield state;
      },
    );
  }

  Stream<AuthenticationState> _mapTimeOut() async* {
    yield* _mapLogout(AuthenticationTimedOutState());
  }

  Stream<AuthenticationState> _mapCheckAuthenticationEvent() async* {
    final result = await tokenExistUseCase(NoParams());
    yield* result.fold(
      (failure) async* {
        yield ErrorAuthenticationState(failure);
      },
      (exist) async* {
        if (!exist) {
          yield AuthenticationUnauthenticated();
        } else {
          yield AuthenticationAuthenticated();
        }
      },
    );
  }
}
