import '../../../domain/entity/pages_data_entity.dart';
import '../model/pages_data_model.dart';

extension PagesDataModelExtension on PagesDataModel {
  PagesData toEntity() {
    return PagesData.fromJson(toJson());
  }
}
