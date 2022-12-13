// import '../../../../../core/error/error_handler.dart';
// import '../../../domain/entity/pages_data_entity.dart';

// const CACHE_PAGESDATA_KEY = "CACHE_PAGESDATA_KEY";
// const CACHE_PAGESDATA_INTERVAL = 60 * 1000; // 1 minute cache in millis

// abstract class PagesDataLocalDataSource {
// // * init the return data, it will be a entity
//   Future<PagesData> getPagesDataData();
//   Future<void> savePagesDataToCache(PagesData pages_data);
// }

// class PagesDataLocalDataSourceImpl implements PagesDataLocalDataSource {
//   Map<String, CachedItem> cacheMap = Map();
//   @override
//   Future<PagesData> getPagesDataData() async {
//     CachedItem? cachedItem = cacheMap[CACHE_PAGESDATA_KEY];
//     if (cachedItem != null && cachedItem.isValid(CACHE_PAGESDATA_INTERVAL)) {
//       return cachedItem.data;
//     } else {
//       throw ErrorHandler.handle(DataSourceError.cacheError);
//     }
//   }

//   @override
//   Future<void> savePagesDataToCache(PagesData pages_data) async {
//     cacheMap[CACHE_PAGESDATA_KEY] = CachedItem(pages_data);
//   }
// }

// class CachedItem {
//   dynamic data;
//   int cacheTime = DateTime.now().millisecondsSinceEpoch;
//   CachedItem(this.data);
// }

// extension CachedItemExtension on CachedItem {
//   bool isValid(int expirationTimeInMillis) {
//     int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;

//     bool isValid = currentTimeInMillis - cacheTime <= expirationTimeInMillis;
//     return isValid;
//   }
// }
