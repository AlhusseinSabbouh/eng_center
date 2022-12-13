// ignore_for_file: non_constant_identifier_names

import 'package:eng_center/config/platform/network_connection.dart';
import 'package:eng_center/features/trivia/data/datasource/local/number_trivia_local_datasource.dart';
import 'package:eng_center/features/trivia/domain/entity/trivia_entity.dart';

import 'package:eng_center/core/error/error_handler.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/trivia_repository.dart';
import '../datasource/remote/number_trivia_remote_datasource.dart';
import '../models/model/number_trivia_model.dart';

class TriviaRepositoryImpl implements NumberTriviaRepository {
  final TriviaRemoteDataSource triviaRemoteDataSource;
  final TriviaLocalDataSource triviaLocalDataSource;
  final NetWorkConnection netWorkConnection;

  TriviaRepositoryImpl(
      {required this.triviaRemoteDataSource,
      required this.triviaLocalDataSource,
      required this.netWorkConnection});

  @override
  Future<Either<Failure, NumberTrivia>>? getConcreteNumberTrivia(
      int number) async {
    netWorkConnection.isConnected();

    final connectingTest = await netWorkConnection.isConnected() ?? false;

    if (connectingTest) {
      try {
        final remoteTrivia = await triviaRemoteDataSource
            .getConcereteTrivia(number) as NumberTriviaModel;
        await triviaLocalDataSource.cachedNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } catch (e) {
        return (Left(DataSourceError.serverError.getFailure()));
      }
    } else {
      try {
        final localTrivia = await triviaLocalDataSource.getLastNumberTrivia()
            as NumberTriviaModel;

        return Right(localTrivia);
      } catch (e) {
        return Left(DataSourceError.cachedError.getFailure());
      }
    }
  }

  @override
  // ignore: avoid_types_as_parameter_names
  Future<Either<Failure, NumberTrivia>>? getRandomNumberTrivia(NoParams) async {
    netWorkConnection.isConnected();

    final connectingTest = await netWorkConnection.isConnected() ?? false;

    if (connectingTest) {
      try {
        final remoteTrivia =
            await triviaRemoteDataSource.getRandomTrivia() as NumberTriviaModel;
        await triviaLocalDataSource.cachedNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } catch (e) {
        return (Left(DataSourceError.serverError.getFailure()));
      }
    } else {
      try {
        final localTrivia = await triviaLocalDataSource.getLastNumberTrivia()
            as NumberTriviaModel;
        return Right(localTrivia);
      } catch (e) {
        return Left(DataSourceError.cachedError.getFailure());
      }
    }
  }

// * return Eithre<Failure , Entity >
}
