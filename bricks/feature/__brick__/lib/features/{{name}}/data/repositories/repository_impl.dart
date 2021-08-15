import 'package:dartz/dartz.dart';
import '../../data/data_sources/data_source.dart';
import '../../domain/repositories/repository.dart';
import '../../../../core/error/failures.dart';

class RepositoryImpl extends Repository {
  RepositoryImpl({required this.dataSource});

  final DataSource dataSource;
  
  Future<Either<Failure, dynamic>> function() {
    // TODO - implement function
    throw UnimplementedError();
  }
}