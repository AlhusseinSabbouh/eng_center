import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/resources/strings_manager.dart';
import '../../models/response/trivia_response.dart';

part 'trivia_api.g.dart';
// todo flutter pub run build_runner build --delete-conflicting-outputs

@RestApi(baseUrl: AppStrings.baseUrl1)
abstract class AppTriviaServiceClient {
  factory AppTriviaServiceClient(Dio dio, {String baseUrl}) =
      _AppTriviaServiceClient;

  @GET("/{id}")
  Future<TriviaResponse>? getConserteNumberTrivia(@Path("id") String id);

  @GET('/')
  Future<TriviaResponse>? getRandomNumberTrivia();
}
