import 'package:dio/dio.dart';
import 'package:eng_center/core/resources/strings_manager.dart';
import 'package:retrofit/http.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:json_annotation/json_annotation.dart';

part 'pages_data_api.g.dart';
// todo flutter pub run build_runner build --delete-conflicting-outputs

@RestApi(baseUrl: AppStrings.baseUrl1)
abstract class AppPagesDataServiceClient {
  factory AppPagesDataServiceClient(Dio dio, {String baseUrl}) =
      _AppPagesDataServiceClient;

  // * make api and return feature response
}
