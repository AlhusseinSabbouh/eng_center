import 'package:dio/dio.dart';
import 'package:eng_center/core/resources/strings_manager.dart';
import 'package:retrofit/http.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ai_api.g.dart';
// todo flutter pub run build_runner build --delete-conflicting-outputs

@RestApi(baseUrl: AppStrings.baseUrl1)
abstract class AppAiServiceClient {
  factory AppAiServiceClient(Dio dio, {String baseUrl}) = _AppAiServiceClient;

  // * make api and return feature response
}
