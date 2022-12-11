import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'trivia_response.g.dart';

@JsonSerializable()
class TriviaBaseResponse {}

@JsonSerializable()
class TriviaResponse extends TriviaBaseResponse {
// * JsonKeys(name:) and nullable
  @JsonKey(name: "text")
  String text;
  @JsonKey(name: "number")
  int number;

  TriviaResponse({required this.number, required this.text});

// ! from json
  factory TriviaResponse.fromJson(Map<String, dynamic> json) =>
      _$TriviaResponseFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$TriviaResponseToJson(this);
}
