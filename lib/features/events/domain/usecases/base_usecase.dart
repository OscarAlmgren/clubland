import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

/// Base class for all use cases
///
/// [T] represents the Success return type.
/// [Params] represents the input parameters.
// ignore: one_member_abstracts
abstract class UseCase<T, Params> {
  /// Execute the use case with the given parameters
  Future<Either<Failure, T>> call(Params params);
}

/// Use case with no parameters
// ignore: one_member_abstracts
abstract class NoParamsUseCase<T> {
  /// Execute the use case with no parameters
  Future<Either<Failure, T>> call();
}
