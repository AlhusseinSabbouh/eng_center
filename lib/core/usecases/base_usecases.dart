import 'package:dartz/dartz.dart';

import '../error/error_handler.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>>? call(In input);
}
