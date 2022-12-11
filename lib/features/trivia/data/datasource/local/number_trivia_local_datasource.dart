import 'package:eng_center/features/trivia/data/models/model/number_trivia_model.dart';

import '../../../../../core/error/error_handler.dart';
import '../../../domain/entity/trivia_entity.dart';
import '../base/trivia_datasource.dart';

const CACHE_TRIVIA_KEY = "CACHE_TRIVIA_KEY";
const CACHE_TRIVIA_INTERVAL = 60 * 10000; // 1 minute cache in millis

abstract class TriviaLocalDataSource {
// * init the return data, it will be a entity

  Future<NumberTriviaModel>? getLastNumberTrivia();
  Future<void>? cachedNumberTrivia(NumberTriviaModel numberTriviaModel);
}

class TriviaLocalDataSourceImpl
    implements TriviaLocalDataSource, TriviaBaseDataSource {
  Map<String, CachedItem> cacheMap = Map();
  @override
  Future<NumberTriviaModel> getTriviaData() async {
    CachedItem? cachedItem = cacheMap[CACHE_TRIVIA_KEY];
    if (cachedItem != null && cachedItem.isValid(CACHE_TRIVIA_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSourceError.cacheError);
    }
  }

  @override
  Future<void> saveTriviaToCache(NumberTriviaModel trivia) async {
    cacheMap[CACHE_TRIVIA_KEY] = CachedItem(trivia);
  }

  @override
  Future<void>? cachedNumberTrivia(NumberTriviaModel numberTriviaModel) async {
    cacheMap[CACHE_TRIVIA_KEY] = CachedItem(numberTriviaModel);
  }

  @override
  Future<NumberTriviaModel>? getLastNumberTrivia() {
    CachedItem? cachedItem = cacheMap[CACHE_TRIVIA_KEY];
    if (cachedItem != null) {
      return cachedItem.data;
    }
  }
}

class Trivia {}

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
