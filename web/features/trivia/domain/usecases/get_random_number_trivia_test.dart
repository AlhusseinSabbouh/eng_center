import 'package:dartz/dartz.dart';
import 'package:eng_center/features/trivia/domain/entity/trivia_entity.dart';
import 'package:eng_center/features/trivia/domain/repository/trivia_repository.dart';
import 'package:eng_center/features/trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late MockNumberTriviaRepository repo;
  late GetRandonNumberTrivia usecase;

  setUp(() {
    repo = MockNumberTriviaRepository();
    usecase = GetRandonNumberTrivia(numberTriviaRepository: repo);
  });

  final tNumberTrivia = NumberTrivia(number: 1, text: 'trivia tester');

  test("we should get random trivia", () async {
    when(repo.getRandomNumberTrivia(NoParams()))
        .thenAnswer((_) async => Right(tNumberTrivia));
    final result = await usecase(NoParams());
    expect(result, Right(tNumberTrivia));
    verify(repo.getRandomNumberTrivia(NoParams()));
  });
}
