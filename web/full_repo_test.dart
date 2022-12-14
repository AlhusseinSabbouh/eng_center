// import 'package:dartz/dartz.dart';
// import 'package:eng_center/config/platform/network_connection.dart';
// import 'package:eng_center/features/ai/data/datasource/utils/ai_api.dart';
// import 'package:eng_center/features/trivia/data/datasource/remote/number_trivia_remote_datasource.dart';
// import 'package:eng_center/features/trivia/data/datasource/utils/trivia_api.dart';
// import 'package:eng_center/features/trivia/data/models/response/trivia_response.dart';
// import 'package:eng_center/features/trivia/data/repository_impl/trivia_repository_impl.dart';
// import 'package:eng_center/features/trivia/domain/entity/trivia_entity.dart';
// import 'package:eng_center/features/trivia/domain/repository/trivia_repository.dart';
// import 'package:eng_center/features/trivia/domain/usecases/get_concrete_number_trivia.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class NetWorkConnectionMock extends Mock implements NetWorkConnection {}

// class NumberTriviaAppClientMock extends Mock implements AppTriviaServiceClient {
// }

// void main() {
//   late NumberTriviaAppClientMock numberTriviaAppClientMock;
//   late NetWorkConnectionMock networkConnection;
//   late NumberTriviaRepository repo;
//   late NumberTriviaRemoteDataSourceImp remoteSouces;
//   late GetConcreteNumberTrivia useCase;

//   setUp(() {
//     networkConnection = NetWorkConnectionMock();
//     numberTriviaAppClientMock = NumberTriviaAppClientMock();
//     remoteSouces = NumberTriviaRemoteDataSourceImp(
//         appTriviaServiceClient: numberTriviaAppClientMock);
//     repo = TriviaRepositoryImpl(
//         netWorkConnection: networkConnection,
//         triviaRemoteDataSource: remoteSouces);
//     useCase = GetConcreteNumberTrivia(repo);
//   });
//   final tNumberTriviaResponse = TriviaResponse(number: 1, text: 'test');
//   test("this will test all application", () async {
//     //arrange
//     when(networkConnection.isConnected())
//         .thenAnswer((realInvocation) async => true);
//     when(numberTriviaAppClientMock.getConserteNumberTrivia("1"))
//         .thenAnswer((realInvocation) async => tNumberTriviaResponse);
//     //act
//     final numberTriviaEntity =
//         await useCase(GetConcreteNumberTriviaInput(number: 1)) ;

//     expect(numberTriviaEntity, isA<Right<dynamic, NumberTrivia>>());
//   });
// }
