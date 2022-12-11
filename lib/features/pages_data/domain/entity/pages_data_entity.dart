import 'package:json_annotation/json_annotation.dart';

part 'pages_data_entity.g.dart';

@JsonSerializable()
class PagesData {
// * JsonKeys(name:)
  PagesData();

// ! from json
  factory PagesData.fromJson(Map<String, dynamic> json) =>
      _$PagesDataFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$PagesDataToJson(this);
}
