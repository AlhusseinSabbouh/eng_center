// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'ai_response.g.dart';

@JsonSerializable()
class AiBaseResponse {}

@JsonSerializable()
class AiResponse extends AiBaseResponse {
// * JsonKeys(name:) and nullable

  AiResponse();

// ! from json
  factory AiResponse.fromJson(Map<String, dynamic> json) =>
      _$AiResponseFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$AiResponseToJson(this);
}
