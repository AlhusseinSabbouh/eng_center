import '../../../../../core/error/error_handler.dart';
import '../../../domain/entity/ai_entity.dart';

const CACHE_AI_KEY = "CACHE_AI_KEY";
const CACHE_AI_INTERVAL = 60 * 1000; // 1 minute cache in millis

abstract class AiLocalDataSource {
// * init the return data, it will be a entity
  Future<Ai> getAiData();
  Future<void> saveAiToCache(Ai ai);
}

class AiLocalDataSourceImpl implements AiLocalDataSource {
  Map<String, CachedItem> cacheMap = Map();
  @override
  Future<Ai> getAiData() async {
    CachedItem? cachedItem = cacheMap[CACHE_AI_KEY];
    if (cachedItem != null && cachedItem.isValid(CACHE_AI_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSourceError.cacheError);
    }
  }

  @override
  Future<void> saveAiToCache(Ai ai) async {
    cacheMap[CACHE_AI_KEY] = CachedItem(ai);
  }
}

class CachedItem {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;
  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTimeInMillis) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;

    bool isValid = currentTimeInMillis - cacheTime <= expirationTimeInMillis;
    return isValid;
  }
}
