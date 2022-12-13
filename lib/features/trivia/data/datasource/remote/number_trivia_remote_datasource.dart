// ignore: unused_import
import 'package:dartz/dartz.dart';
import 'package:eng_center/features/trivia/data/models/model/number_trivia_model.dart';

import 'package:eng_center/features/trivia/data/models/mapper/trivia_response_2_model.dart';

import '../base/trivia_datasource.dart';
import '../utils/trivia_api.dart';

abstract class TriviaRemoteDataSource implements TriviaBaseDataSource {
  final AppTriviaServiceClient appTriviaServiceClient;
  TriviaRemoteDataSource({required this.appTriviaServiceClient});

  Future<NumberTriviaModel>? getConcereteTrivia(int number);
  Future<NumberTriviaModel>? getRandomTrivia();
  // * return Future of Model

}

class NumberTriviaRemoteDataSourceImp
    implements TriviaRemoteDataSource, TriviaBaseDataSource {
  @override
  final AppTriviaServiceClient appTriviaServiceClient;
  NumberTriviaRemoteDataSourceImp({required this.appTriviaServiceClient});

  @override
  Future<NumberTriviaModel>? getConcereteTrivia(int number) async {
    final rawData =
        await appTriviaServiceClient.getConserteNumberTrivia(number.toString());
    final numberTriviaModerRemote = rawData?.toModel() as NumberTriviaModel;
    return numberTriviaModerRemote;
  }

  @override
  Future<NumberTriviaModel>? getRandomTrivia() async {
    final rawData = await appTriviaServiceClient.getRandomNumberTrivia();
    final numberTriviaModerRemote = rawData!.toModel();
    return numberTriviaModerRemote;
  }
}
