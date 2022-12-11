import '../../../domain/entity/ai_entity.dart';
import '../model/ai_model.dart';

extension AiModelExtension on AiModel {
  Ai toEntity() {
    return Ai.fromJson(toJson());
  }
}
