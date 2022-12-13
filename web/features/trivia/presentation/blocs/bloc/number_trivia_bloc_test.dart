import 'package:eng_center/config/platform/network_connection.dart';
import 'package:eng_center/core/error/error_handler.dart';
import 'package:eng_center/features/trivia/data/datasource/local/number_trivia_local_datasource.dart';
import 'package:eng_center/features/trivia/data/datasource/remote/number_trivia_remote_datasource.dart';
import 'package:eng_center/features/trivia/data/datasource/utils/trivia_api.dart';
import 'package:eng_center/features/trivia/data/models/model/number_trivia_model.dart';
import 'package:eng_center/features/trivia/data/models/response/trivia_response.dart';
import 'package:eng_center/features/trivia/data/repository_impl/trivia_repository_impl.dart';
import 'package:eng_center/features/trivia/domain/repository/trivia_repository.dart';
import 'package:eng_center/features/trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:eng_center/features/trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:eng_center/features/trivia/presentation/blocs/bloc/number_trivia_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

// class NumberTriviaBlocMock extends Mock implements NumberTriviaBloc{}

class NetWorkConnectionMock extends Mock implements NetWorkConnection {}

class LocalDataSourceMock extends Mock implements TriviaLocalDataSource {}

class NumberTriviaAppClientMock extends Mock implements AppTriviaServiceClient {
}

// class MockNumberTriviaBloc
//     extends MockBloc<NumberTriviaEvent, NumberTriviaState>
//     implements NumberTriviaBloc {}

void main() async {
  late NumberTriviaAppClientMock numberTriviaAppClientMock;
  late NetWorkConnectionMock networkConnection;
  late NumberTriviaRepository repo;
  late NumberTriviaRemoteDataSourceImp remoteSouces;
  late GetConcreteNumberTrivia useCase;
  late GetRandonNumberTrivia useCase1;
  late LocalDataSourceMock localDataSoruce;
  // ignore: unused_local_variable
  late NumberTriviaBloc mockBloc;
  setUp(() {
    networkConnection = NetWorkConnectionMock();
    numberTriviaAppClientMock = NumberTriviaAppClientMock();
    localDataSoruce = LocalDataSourceMock();
    remoteSouces = NumberTriviaRemoteDataSourceImp(
        appTriviaServiceClient: numberTriviaAppClientMock);
    repo = TriviaRepositoryImpl(
        netWorkConnection: networkConnection,
        triviaLocalDataSource: localDataSoruce,
        triviaRemoteDataSource: remoteSouces);
    useCase = GetConcreteNumberTrivia(repo);
    useCase1 = GetRandonNumberTrivia(numberTriviaRepository: repo);
    mockBloc = NumberTriviaBloc(
        getConcreteNumberTriviaUsecase: useCase,
        getRandonNumberTriviaUsecase: useCase1);
  });
  final tNumberTriviaResponse = TriviaResponse(number: 1, text: 'test');
  const tNumberTriviaModel = NumberTriviaModel(text: "test", number: 1);

  blocTest<NumberTriviaBloc, NumberTriviaState>(
    "enter right number and get right response",
    setUp: () async {
      when(networkConnection.isConnected())
          .thenAnswer((realInvocation) async => true);
      when(numberTriviaAppClientMock.getConserteNumberTrivia("1"))
          .thenAnswer((realInvocation) async => tNumberTriviaResponse);
    },
    build: () => NumberTriviaBloc(
      getConcreteNumberTriviaUsecase: useCase,
      getRandonNumberTriviaUsecase: useCase1,
    ),
    act: (bloc) => bloc.add(const GetConcerteNumberTriviaEvent(number: "8")),
    wait: const Duration(milliseconds: 300),
    expect: () => [
      isA<NumberTriviaLoading>(),
      isA<NumberTriviaLoaded>(),
    ],
  );
  blocTest<NumberTriviaBloc, NumberTriviaState>(
    "inter invalid number",
    setUp: () async {
      when(networkConnection.isConnected())
          .thenAnswer((realInvocation) async => true);
      when(numberTriviaAppClientMock.getConserteNumberTrivia("1"))
          .thenAnswer((realInvocation) async => tNumberTriviaResponse);
    },
    build: () => NumberTriviaBloc(
      getConcreteNumberTriviaUsecase: useCase,
      getRandonNumberTriviaUsecase: useCase1,
    ),
    act: (bloc) => bloc.add(const GetConcerteNumberTriviaEvent(number: "-8")),
    wait: const Duration(milliseconds: 300),
    expect: () => [
      isA<NumberTriviaLoading>(),
      isA<NumberTriviaIError>(),
    ],
  );
  blocTest<NumberTriviaBloc, NumberTriviaState>(
    "get any data source error",
    setUp: () async {
      when(networkConnection.isConnected())
          .thenAnswer((realInvocation) async => true);
      when(numberTriviaAppClientMock.getConserteNumberTrivia("1"))
          .thenThrow(DataSourceError.serverError.getFailure());
    },
    build: () => NumberTriviaBloc(
      getConcreteNumberTriviaUsecase: useCase,
      getRandonNumberTriviaUsecase: useCase1,
    ),
    act: (bloc) => bloc.add(const GetConcerteNumberTriviaEvent(number: "-8")),
    wait: const Duration(milliseconds: 300),
    expect: () => [
      isA<NumberTriviaLoading>(),
      isA<NumberTriviaIError>(),
    ],
  );
  blocTest<NumberTriviaBloc, NumberTriviaState>(
    "get random number trivia",
    setUp: () async {
      when(networkConnection.isConnected())
          .thenAnswer((realInvocation) async => true);
      when(numberTriviaAppClientMock.getRandomNumberTrivia())
          .thenAnswer((realInvocation) async => tNumberTriviaResponse);
    },
    build: () => NumberTriviaBloc(
      getConcreteNumberTriviaUsecase: useCase,
      getRandonNumberTriviaUsecase: useCase1,
    ),
    act: (bloc) => bloc.add(const GetRandomNumberTriviaEvent()),
    wait: const Duration(milliseconds: 300),
    expect: () => [
      isA<NumberTriviaLoading>(),
      isA<NumberTriviaLoaded>(),
    ],
  );
  blocTest<NumberTriviaBloc, NumberTriviaState>(
    "get last saved number trivia",
    setUp: () async {
      when(networkConnection.isConnected())
          .thenAnswer((realInvocation) async => false);
      // when(numberTriviaAppClientMock.getRandomNumberTrivia())
      //     .thenAnswer((realInvocation) async => tNumberTriviaResponse);
      when(localDataSoruce.getLastNumberTrivia())
          .thenAnswer((realInvocation) async => tNumberTriviaModel);
    },
    build: () => NumberTriviaBloc(
      getConcreteNumberTriviaUsecase: useCase,
      getRandonNumberTriviaUsecase: useCase1,
    ),
    act: (bloc) => bloc.add(const GetRandomNumberTriviaEvent()),
    wait: const Duration(milliseconds: 300),
    expect: () => [
      isA<NumberTriviaLoading>(),
      isA<NumberTriviaLoaded>(),
    ],
  );
  blocTest<NumberTriviaBloc, NumberTriviaState>(
    "get failure when we can't return the value",
    setUp: () async {
      when(networkConnection.isConnected())
          .thenAnswer((realInvocation) async => false);
      // when(numberTriviaAppClientMock.getRandomNumberTrivia())
      //     .thenAnswer((realInvocation) async => tNumberTriviaResponse);
      when(localDataSoruce.getLastNumberTrivia())
          .thenThrow(DataSourceError.cachedError.getFailure());
    },
    build: () => NumberTriviaBloc(
      getConcreteNumberTriviaUsecase: useCase,
      getRandonNumberTriviaUsecase: useCase1,
    ),
    act: (bloc) => bloc.add(const GetRandomNumberTriviaEvent()),
    wait: const Duration(milliseconds: 300),
    expect: () => [
      isA<NumberTriviaLoading>(),
      isA<NumberTriviaIError>(),
    ],
  );
}
