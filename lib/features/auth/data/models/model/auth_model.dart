// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
// * JsonKeys(name:)
  AuthModel();

// ! from json
  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
