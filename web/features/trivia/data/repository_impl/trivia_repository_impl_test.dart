import 'package:dartz/dartz.dart';
import 'package:eng_center/config/platform/network_connection.dart';
import 'package:eng_center/core/error/error_handler.dart';
import 'package:eng_center/features/trivia/data/datasource/local/number_trivia_local_datasource.dart';
import 'package:eng_center/features/trivia/data/datasource/remote/number_trivia_remote_datasource.dart';
import 'package:eng_center/features/trivia/data/models/model/number_trivia_model.dart';
import 'package:eng_center/features/trivia/data/repository_impl/trivia_repository_impl.dart';
import 'package:eng_center/features/trivia/domain/repository/trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TriviaLocalDataSourceMock extends Mock implements TriviaLocalDataSource {}

class TriviaRemoteDataSourceMock extends Mock
    implements TriviaRemoteDataSource {}

class NetWorkConnectionMock extends Mock implements NetWorkConnection {}

void main() {
  late TriviaLocalDataSourceMock localDataSource;
  late TriviaRemoteDataSourceMock remoteDataSource;
  late NetWorkConnectionMock netWorkConnection;
  late NumberTriviaRepository repository;

  setUp(() {
    localDataSource = TriviaLocalDataSourceMock();
    remoteDataSource = TriviaRemoteDataSourceMock();
    netWorkConnection = NetWorkConnectionMock();
    repository = TriviaRepositoryImpl(
        netWorkConnection: netWorkConnection,
        triviaLocalDataSource: localDataSource,
        triviaRemoteDataSource: remoteDataSource);
  });

  //   when(netWorkConnection.isConnected())
  //       .thenAnswer((realInvocation) async => true);

  // ignore: prefer_const_declarations
  final tNumberTriviaModelRemote =
      const NumberTriviaModel(text: "from remote", number: 1);
  // ignore: prefer_const_declarations
  final tNumberTriviaModelLocal =
      const NumberTriviaModel(text: "from local", number: 1);

  group("when we online", () {
    test("we should get Failure when exception is gone", () async {
      when(netWorkConnection.isConnected()).thenAnswer((_) async => true);
      when(remoteDataSource.getConcereteTrivia(1))
          .thenThrow(DataSourceError.serverError.getFailure());
      final result = await repository.getConcreteNumberTrivia(1);

      expect(result, Left(DataSourceError.serverError.getFailure()));
    });
    test("we should get the remote trivia when we are connecting", () async {
      when(remoteDataSource.getConcereteTrivia(2))
          .thenAnswer((_) async => tNumberTriviaModelRemote);
      when(localDataSource.getLastNumberTrivia())
          .thenAnswer((realInvocation) async => tNumberTriviaModelLocal);
      //we are connectiog
      when(netWorkConnection.isConnected()).thenAnswer((_) async => true);

      final result = await repository.getConcreteNumberTrivia(2);
      // verifyZeroInteractions(localDataSource);
      expect(result, Right(tNumberTriviaModelRemote));
    });
  });

  group("when we offline", () {
    test("we should get the local trivia when we are disconnection", () async {
      when(remoteDataSource.getConcereteTrivia(2))
          .thenAnswer((_) async => tNumberTriviaModelRemote);
      when(localDataSource.getLastNumberTrivia())
          .thenAnswer((realInvocation) async => tNumberTriviaModelLocal);
      //we are disconnectiog
      when(netWorkConnection.isConnected()).thenAnswer((_) async => false);
      final result = await repository.getConcreteNumberTrivia(2);
      expect(result, Right(tNumberTriviaModelLocal));
    });
    test("we should get the fauiler when we are disconnection", () async {
      when(remoteDataSource.getConcereteTrivia(2))
          .thenAnswer((_) async => tNumberTriviaModelRemote);
      when(localDataSource.getLastNumberTrivia())
          .thenThrow(DataSourceError.cachedError.getFailure());
      //we are disconnectiog
      when(netWorkConnection.isConnected()).thenAnswer((_) async => false);
      final result = await repository.getConcreteNumberTrivia(2);
      expect(result, Left(DataSourceError.cachedError.getFailure()));
    });
  });
}
