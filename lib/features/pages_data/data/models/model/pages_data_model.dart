import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pages_data_model.g.dart';

@JsonSerializable()
class PagesDataModel {
// * JsonKeys(name:)
  PagesDataModel();

// ! from json
  factory PagesDataModel.fromJson(Map<String, dynamic> json) =>
      _$PagesDataModelFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$PagesDataModelToJson(this);
}
