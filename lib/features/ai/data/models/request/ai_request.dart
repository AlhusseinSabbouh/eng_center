import 'package:json_annotation/json_annotation.dart';
part 'ai_request.g.dart';

// todo flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class BaseRequest {}

@JsonSerializable()
class AiRequest extends BaseRequest {
  AiRequest();

  // ! from json
  factory AiRequest.fromJson(Map<String, dynamic> json) =>
      _$AiRequestFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$AiRequestToJson(this);
}
