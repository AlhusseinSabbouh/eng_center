import 'package:eng_center/core/error/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:eng_center/core/usecases/base_usecases.dart';
import 'package:eng_center/features/pages_data/domain/entity/product.dart';
import 'package:eng_center/features/pages_data/domain/repository/pages_data_repository.dart';
import 'package:eng_center/features/trivia/domain/usecases/get_random_number_trivia.dart';

class GetAllMainPageProduct
    extends BaseUseCase<GetAllMainPageProductInput, PageProducts> {
  final ProductRepository productRepository;
  GetAllMainPageProduct({required this.productRepository});

  @override
  Future<Either<Failure, PageProducts>>? call(
      GetAllMainPageProductInput input) {
    return productRepository.getMainPageProduct(
        showed: input.showedProduct, pageNumber: input.pageNumber);
  }
}

class GetAllMainPageProductInput {
  List<String> showedProduct;
  int pageNumber;
  GetAllMainPageProductInput({
    required this.showedProduct,
    required this.pageNumber,
  });
}
