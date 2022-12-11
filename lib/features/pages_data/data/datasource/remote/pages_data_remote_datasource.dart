import '../base/pages_data_datasource.dart';
import '../utils/pages_data_api.dart';

abstract class PagesDataRemoteDataSource implements PagesDataBaseDataSource {
  final AppPagesDataServiceClient appPagesDataServiceClient;

  PagesDataRemoteDataSource({required this.appPagesDataServiceClient});

  // * return Future of Model

}
