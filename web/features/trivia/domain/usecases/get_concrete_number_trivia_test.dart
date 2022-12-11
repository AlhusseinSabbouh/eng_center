import 'package:dartz/dartz.dart';
import 'package:eng_center/core/error/error_handler.dart';
import 'package:eng_center/features/trivia/domain/entity/trivia_entity.dart';
import 'package:eng_center/features/trivia/domain/repository/trivia_repository.dart';
import 'package:eng_center/features/trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  MockNumberTriviaRepository mockNumberTriviaRepository =
      MockNumberTriviaRepository();

  GetConcreteNumberTrivia usecase =
      GetConcreteNumberTrivia(mockNumberTriviaRepository);

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia for the number from the repository',
    () async {
      // arrange
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(1))
          .thenAnswer((_) async => Right(tNumberTrivia));
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(2)).thenAnswer(
          (_) async => Left(DataSourceError.cacheError.getFailure()));
      // act
      final result = await usecase(GetConcreteNumberTriviaInput(number: 1));
      final result2 = await usecase(GetConcreteNumberTriviaInput(number: 2));
      // print(result2);
      // assert
      expect(result, Right(tNumberTrivia));
      expect(result2, Left(DataSourceError.cacheError.getFailure()));
      // verify(mockNumberTriviaRepository.getConcreteNumberTrivia(2));
      // verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
