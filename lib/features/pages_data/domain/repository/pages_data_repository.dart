import 'package:dartz/dartz.dart';
import 'package:eng_center/core/error/error_handler.dart';
import 'package:eng_center/features/pages_data/domain/entity/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, PageProducts>>? getMainPageProduct(
      {required List<String> showed, required int pageNumber});
  Future<Either<Failure, Product>>? getConcerteProduct(
      {required String productId});
}
