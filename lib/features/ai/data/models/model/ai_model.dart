// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'ai_model.g.dart';

@JsonSerializable()
class AiModel {
// * JsonKeys(name:)
  AiModel();

// ! from json
  factory AiModel.fromJson(Map<String, dynamic> json) =>
      _$AiModelFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$AiModelToJson(this);
}
