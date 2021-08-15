import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:mason_testing_ground/features/authorization/data/data_sources/local_auth_data_source.dart';
import 'package:mason_testing_ground/features/authorization/data/data_sources/remote_auth_data_source.dart';
import 'package:mason_testing_ground/features/authorization/data/interceptors/auth_interceptor.dart';
import 'package:mason_testing_ground/features/authorization/data/repositories/auth_repository_impl.dart';
import 'package:mason_testing_ground/features/authorization/domain/repositories/auth_repository.dart';
import 'package:mason_testing_ground/features/authorization/domain/use_cases/get_token_usecase.dart';
import 'package:mason_testing_ground/features/authorization/domain/use_cases/log_in_usecase.dart';
import 'package:mason_testing_ground/features/authorization/domain/use_cases/remove_token_usecase.dart';
import 'package:mason_testing_ground/features/authorization/domain/use_cases/sign_out_usecase.dart';
import 'package:mason_testing_ground/features/authorization/domain/use_cases/token_exist_usecase.dart';
import 'package:mason_testing_ground/features/authorization/presentation/blocs/auth/authentication_bloc.dart';
import 'package:mason_testing_ground/features/authorization/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:mason_testing_ground/injection_container.dart';

mixin AuthInjector on Injector {
  static const authBoxId = 'AUTH_BOX_ID';

  @override
  Future<void> init() async {
    await super.init();

    //misc
    Hive.registerAdapter(TokenModelAdapter());

    final box = await Hive.openBox(authBoxId);
    sl.registerLazySingleton<Box>(() => box, instanceName: authBoxId);

    // blocs
    sl.registerLazySingleton(() => AuthenticationBloc(
          tokenExistUseCase: sl(),
          signOutUseCase: sl(),
        ));

    sl.registerFactory<LoginBloc>(() => LoginBloc(
          logInUseCase: sl(),
          authenticationBloc: sl(),
        ));

    // use cases
    sl.registerLazySingleton(() => LogInUseCase(repository: sl()));
    sl.registerLazySingleton(() => GetTokenUseCase(repository: sl()));
    sl.registerLazySingleton(() => RemoveTokenUseCase(repository: sl()));
    sl.registerLazySingleton(() => SignOutUseCase(repository: sl()));
    sl.registerLazySingleton(() => TokenExistUseCase(repository: sl()));

    // repositories
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(localDataSource: sl(), remoteDataSource: sl()));

    // data sources
    sl.registerLazySingleton<RemoteAuthDataSource>(() => RemoteAuthDataSourceImpl(source: sl(instanceName: globalDio)));
    sl.registerLazySingleton<LocalAuthDataSource>(() => LocalAuthDataSourceImpl(source: sl(instanceName: authBoxId)));

    // interceptors
    sl<Dio>(instanceName: globalDio).interceptors.insert(
        0,
        AuthInterceptor(
          tokenExistUseCase: sl(),
          removeTokenUseCase: sl(),
          getTokenUseCase: sl(),
          authenticationBloc: sl(),
        ));
  }
}
