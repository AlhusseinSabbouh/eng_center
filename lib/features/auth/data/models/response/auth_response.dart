import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthBaseResponse {}

@JsonSerializable()
class AuthResponse extends AuthBaseResponse {
// * JsonKeys(name:) and nullable

  AuthResponse();

// ! from json
  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
