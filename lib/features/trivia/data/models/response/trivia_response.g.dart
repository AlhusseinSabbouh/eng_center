// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trivia_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TriviaBaseResponse _$TriviaBaseResponseFromJson(Map<String, dynamic> json) =>
    TriviaBaseResponse();

Map<String, dynamic> _$TriviaBaseResponseToJson(TriviaBaseResponse instance) =>
    <String, dynamic>{};

TriviaResponse _$TriviaResponseFromJson(Map<String, dynamic> json) =>
    TriviaResponse(
      number: json['number'] as int,
      text: json['text'] as String,
    );

Map<String, dynamic> _$TriviaResponseToJson(TriviaResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
      'number': instance.number,
    };
