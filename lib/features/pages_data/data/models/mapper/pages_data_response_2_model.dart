import '../model/pages_data_model.dart';
import '../response/pages_data_response.dart';

extension PagesDataResponseExtension on PagesDataResponse? {
  PagesDataModel toModel() {
    return PagesDataModel(
        // * here we need to add the attribute
        );
  }
}
