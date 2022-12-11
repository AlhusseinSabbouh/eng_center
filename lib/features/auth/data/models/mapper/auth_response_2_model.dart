import '../model/auth_model.dart';
import '../response/auth_response.dart';

extension AuthResponseExtension on AuthResponse? {
  AuthModel toModel() {
    return AuthModel(
        // * here we need to add the attribute
        );
  }
}
