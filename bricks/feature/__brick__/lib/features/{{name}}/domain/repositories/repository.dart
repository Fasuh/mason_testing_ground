import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class Repository {
  Future<Either<Failure, dynamic>> function();
}
