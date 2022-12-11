import 'package:json_annotation/json_annotation.dart';
part 'trivia_request.g.dart';

// todo flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class BaseRequest {}

@JsonSerializable()
class TriviaRequest extends BaseRequest {
  TriviaRequest();

  // ! from json
  factory TriviaRequest.fromJson(Map<String, dynamic> json) =>
      _$TriviaRequestFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$TriviaRequestToJson(this);
}
