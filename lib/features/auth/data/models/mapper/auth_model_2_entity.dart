import '../../../domain/entity/auth_entity.dart';
import '../model/auth_model.dart';

extension AuthModelExtension on AuthModel {
  Auth toEntity() {
    return Auth.fromJson(toJson());
  }
}
