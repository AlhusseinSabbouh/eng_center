// ignore: depend_on_referenced_packages, unused_import
import 'package:eng_center/features/pages_data/domain/entity/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Product {
  ProductModel(
      {required String id,
      required String name,
      required String vendorId,
      required String price,
      required String imageUrl,
      required String alpha})
      : super(
            id: id,
            alpha: alpha,
            vendorId: vendorId,
            name: name,
            price: price,
            imageUrl: imageUrl);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
