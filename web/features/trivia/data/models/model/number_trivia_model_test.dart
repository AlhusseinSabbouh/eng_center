import 'dart:convert';

import 'package:eng_center/features/trivia/data/models/model/number_trivia_model.dart';
import 'package:eng_center/features/trivia/domain/entity/trivia_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fexture/fexture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: "test Text");

  group("from Json", () {
    test("should return a valid model when Json is an double", () async {
      final Map<String, dynamic> jsonMap =
          jsonDecode(fexture('trivia_double.json'));

      //here we act we take json Map form internet and we want
      //to know if The NumberTriviaModel work correct
      final result = NumberTriviaModel.fromJson(jsonMap);
      expect(result, isA<NumberTriviaModel>());
    });

    test("should return a Json Map that containing the proper data", () async {
      //act
      final result = tNumberTriviaModel.toJson();
      final expectedJson = {"text": "test Text", "number": 1};
      expect(result, expectedJson);
    });
  });

  test("should Number Trivia Model is a subClass of Number Trivia entity",
      () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });
}
