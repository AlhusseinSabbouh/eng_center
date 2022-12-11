// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:eng_center/core/error/error_handler.dart';
import 'package:eng_center/core/usecases/base_usecases.dart';
import 'package:eng_center/features/trivia/domain/entity/trivia_entity.dart';
import 'package:eng_center/features/trivia/domain/repository/trivia_repository.dart';

class GetConcreteNumberTrivia
    implements BaseUseCase<GetConcreteNumberTriviaInput, NumberTrivia> {
  final NumberTriviaRepository numberTriviaRepository;
  GetConcreteNumberTrivia(this.numberTriviaRepository);

  @override
  Future<Either<Failure, NumberTrivia>>? call(
      GetConcreteNumberTriviaInput input) {
    return numberTriviaRepository.getConcreteNumberTrivia(input.number);
  }
}

class GetConcreteNumberTriviaInput {
  final int number;
  GetConcreteNumberTriviaInput({
    required this.number,
  });
}
