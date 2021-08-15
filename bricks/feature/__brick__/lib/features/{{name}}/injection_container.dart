import '../../injection_container.dart';
import 'data/data_sources/data_source.dart';
import 'data/repositories/repository_impl.dart';
import 'domain/repositories/repository.dart';
import 'domain/use_cases/use_case.dart';

mixin NewFeatureInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    // use cases
    sl.registerLazySingleton(() => NewUseCase(repository: sl()));

    // repositories
    sl.registerLazySingleton<Repository>(() => RepositoryImpl(dataSource: sl()));

    // data sources
    sl.registerLazySingleton<DataSource>(() => DataSourceImpl(source: sl()));
  }
}
