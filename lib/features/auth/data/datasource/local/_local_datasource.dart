import '../../../../../core/error/error_handler.dart';
import '../../../domain/entity/auth_entity.dart';

const CACHE_AUTH_KEY = "CACHE_AUTH_KEY";
const CACHE_AUTH_INTERVAL = 60 * 1000; // 1 minute cache in millis

abstract class AuthLocalDataSource {
// * init the return data, it will be a entity
  Future<Auth> getAuthData();
  Future<void> saveAuthToCache(Auth auth);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  Map<String, CachedItem> cacheMap = Map();
  @override
  Future<Auth> getAuthData() async {
    CachedItem? cachedItem = cacheMap[CACHE_AUTH_KEY];
    if (cachedItem != null && cachedItem.isValid(CACHE_AUTH_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSourceError.cacheError);
    }
  }

  @override
  Future<void> saveAuthToCache(Auth auth) async {
    cacheMap[CACHE_AUTH_KEY] = CachedItem(auth);
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
