// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'ai_entity.g.dart';

@JsonSerializable()
class Ai {
// * JsonKeys(name:)
  Ai();

// ! from json
  factory Ai.fromJson(Map<String, dynamic> json) => _$AiFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$AiToJson(this);
}
