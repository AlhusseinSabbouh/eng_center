import 'package:json_annotation/json_annotation.dart';
part 'auth_request.g.dart';

// todo flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class BaseRequest {}

@JsonSerializable()
class AuthRequest extends BaseRequest {
  AuthRequest();

  // ! from json
  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}
