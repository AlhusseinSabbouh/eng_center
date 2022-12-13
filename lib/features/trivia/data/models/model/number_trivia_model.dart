import 'package:eng_center/features/trivia/domain/entity/trivia_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'number_trivia_model.g.dart';

@JsonSerializable()
class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel({required String text, required int number})
      : super(number: number, text: text);

// ! from json
  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) =>
      _$NumberTriviaModelFromJson(json);
// ! to json
  Map<String, dynamic> toJson() => _$NumberTriviaModelToJson(this);

//! here if we have multi shape of the respose
  factory NumberTriviaModel.formNewJson(Map<String, dynamic> json) {
    return NumberTriviaModel(text: json["texto"], number: json["jsono"]);
  }
}
