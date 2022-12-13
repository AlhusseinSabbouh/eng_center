// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'pages_data_response.g.dart';

@JsonSerializable()
class PagesDataBaseResponse {}

@JsonSerializable()
class PagesDataResponse extends PagesDataBaseResponse {
// * JsonKeys(name:) and nullable

  PagesDataResponse();

// ! from json
  factory PagesDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PagesDataResponseFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$PagesDataResponseToJson(this);
}
