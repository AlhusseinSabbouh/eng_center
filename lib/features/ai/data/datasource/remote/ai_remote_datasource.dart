import '../base/ai_datasource.dart';
import '../utils/ai_api.dart';

abstract class AiRemoteDataSource implements AiBaseDataSource {
  final AppAiServiceClient appAiServiceClient;

  AiRemoteDataSource({required this.appAiServiceClient});

  // * return Future of Model

}
