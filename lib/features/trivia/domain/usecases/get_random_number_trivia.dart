// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:eng_center/core/error/error_handler.dart';
import 'package:eng_center/core/usecases/base_usecases.dart';
import 'package:eng_center/features/trivia/domain/entity/trivia_entity.dart';
import 'package:equatable/equatable.dart';

import '../repository/trivia_repository.dart';

class GetRandonNumberTrivia implements BaseUseCase<NoParams, NumberTrivia> {
  final NumberTriviaRepository numberTriviaRepository;
  GetRandonNumberTrivia({
    required this.numberTriviaRepository,
  });

  @override
  Future<Either<Failure, NumberTrivia>>? call(NoParams input) {
    return numberTriviaRepository.getRandomNumberTrivia(NoParams());
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
