import 'package:dartz/dartz.dart';
import 'package:eng_center/core/error/error_handler.dart';

class NumberConverter {
  Either<Failure, int> string2intConverter(String str) {
    try {
      final int number = int.parse(str);
      if (number < 0) return Left(DataSourceError.invalidInput.getFailure());
      return Right(number);
    } catch (e) {
      return Left(DataSourceError.invalidInput.getFailure());
    }
  }
}
