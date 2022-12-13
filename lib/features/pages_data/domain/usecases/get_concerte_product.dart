// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:eng_center/core/error/error_handler.dart';
import 'package:eng_center/core/usecases/base_usecases.dart';
import 'package:eng_center/features/pages_data/domain/entity/product.dart';
import 'package:eng_center/features/pages_data/domain/repository/pages_data_repository.dart';
import 'package:eng_center/features/trivia/domain/usecases/get_random_number_trivia.dart';

class GetConcerteProduct extends BaseUseCase<String, Product> {
  final ProductRepository productRepository;
  GetConcerteProduct({required this.productRepository});

  @override
  Future<Either<Failure, Product>>? call(String input) {
    return productRepository.getConcerteProduct(productId: input);
  }
}
