import 'package:eng_center/features/trivia/data/datasource/local/number_trivia_local_datasource.dart';
import 'package:eng_center/features/trivia/data/datasource/remote/number_trivia_remote_datasource.dart';
import 'package:eng_center/features/trivia/data/datasource/utils/trivia_api.dart';
import 'package:eng_center/features/trivia/data/models/model/number_trivia_model.dart';
import 'package:eng_center/features/trivia/data/models/response/trivia_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class NumberTriviaAppClientMock extends Mock implements AppTriviaServiceClient {
}

void main() {
  late NumberTriviaAppClientMock appServerClient;
  late TriviaRemoteDataSource triviaRemoteDataSource;

  setUp(() {
    appServerClient = NumberTriviaAppClientMock();
    triviaRemoteDataSource = NumberTriviaRemoteDataSourceImp(
        appTriviaServiceClient: appServerClient);
  });
  final tTriviaResponse = TriviaResponse(number: 1, text: "test Text");

  test("here we need to test the app server client", () async {
    //arrange
    when(appServerClient.getConserteNumberTrivia("1"))
        .thenAnswer((realInvocation) async => tTriviaResponse);
    //act
    final result = await triviaRemoteDataSource.getConcereteTrivia(1);
    //assert
    expect(result, isA<NumberTriviaModel>());
  });
}
