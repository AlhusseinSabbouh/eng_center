import 'package:json_annotation/json_annotation.dart';
part 'pages_data_request.g.dart';

// todo flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class BaseRequest {}

@JsonSerializable()
class PagesDataRequest extends BaseRequest {
  PagesDataRequest();

  // ! from json
  factory PagesDataRequest.fromJson(Map<String, dynamic> json) =>
      _$PagesDataRequestFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$PagesDataRequestToJson(this);
}
