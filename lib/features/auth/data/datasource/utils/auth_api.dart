import 'package:dio/dio.dart';
import 'package:eng_center/core/resources/strings_manager.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'auth_api.g.dart';
// todo flutter pub run build_runner build --delete-conflicting-outputs

@RestApi(baseUrl: AppStrings.baseUrl1)
abstract class AppAuthServiceClient {
  factory AppAuthServiceClient(Dio dio, {String baseUrl}) =
      _AppAuthServiceClient;

  // * make api and return feature response
}
