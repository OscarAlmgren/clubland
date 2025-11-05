import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

/// Base class for all use cases
///
/// A use case represents a single business operation in the application.
/// It takes parameters of type [Params] and returns [Either<Failure, Type>].
///
/// Type parameters:
/// - [Type]: The return type of the use case
/// - [Params]: The parameters type for the use case
abstract class UseCase<Type, Params> {
  /// Execute the use case with the given parameters
  ///
  /// Returns:
  /// - [Right<Type>]: Success result
  /// - [Left<Failure>]: Failure result
  Future<Either<Failure, Type>> call(Params params);
}

/// Use case with no parameters
abstract class NoParamsUseCase<Type> {
  /// Execute the use case with no parameters
  ///
  /// Returns:
  /// - [Right<Type>]: Success result
  /// - [Left<Failure>]: Failure result
  Future<Either<Failure, Type>> call();
}
