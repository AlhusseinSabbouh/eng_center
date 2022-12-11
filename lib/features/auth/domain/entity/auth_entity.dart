import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'auth_entity.g.dart';

@JsonSerializable()
class Auth {
// * JsonKeys(name:)
  Auth();

// ! from json
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
