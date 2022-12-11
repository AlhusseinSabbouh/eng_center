// extension AiModelExtension on AiModel {
//   Ai toEntity() {
//     return Ai.fromJson(toJson());
//   }
// }

import 'package:eng_center/features/trivia/data/models/model/number_trivia_model.dart';
import 'package:eng_center/features/trivia/data/models/response/trivia_response.dart';

extension NumberTriviaExtension on TriviaResponse {
  NumberTriviaModel toModel() {
    return NumberTriviaModel.fromJson(toJson());
  }
}
