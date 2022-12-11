import 'package:dartz/dartz.dart';
import 'package:eng_center/core/error/error_handler.dart';
import 'package:eng_center/features/trivia/domain/entity/trivia_entity.dart';
import 'package:eng_center/features/trivia/domain/usecases/get_random_number_trivia.dart';

abstract class NumberTriviaRepository {
//here we return Either<Failure , Entity> to useCase

  Future<Either<Failure, NumberTrivia>>? getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>>? getRandomNumberTrivia(
      NoParams noParams);
}
