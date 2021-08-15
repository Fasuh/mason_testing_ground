import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../domain/repositories/repository.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/error/failures.dart';

class NewUseCase extends UseCase<dynamic, NoParams> {
  NewUseCase({required this.repository});

  final Repository repository;

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.function();
  }
}
