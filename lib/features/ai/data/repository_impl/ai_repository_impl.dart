import '../../domain/repository/ai_repository.dart';
import '../datasource/remote/ai_remote_datasource.dart';

class AiRepositoryImpl implements AiRepository {
  final AiRemoteDataSource aiRemoteDataSource;

  AiRepositoryImpl({required this.aiRemoteDataSource});

// * return Eithre<Failure , Entity >
}
