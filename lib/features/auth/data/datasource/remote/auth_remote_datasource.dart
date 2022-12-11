import '../base/auth_datasource.dart';
import '../utils/auth_api.dart';

abstract class AuthRemoteDataSource implements AuthBaseDataSource {
  final AppAuthServiceClient appAuthServiceClient;

  AuthRemoteDataSource({required this.appAuthServiceClient});

  // * return Future of Model

}
