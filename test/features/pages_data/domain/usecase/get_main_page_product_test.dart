import 'package:dartz/dartz.dart';
import 'package:eng_center/features/pages_data/domain/entity/product.dart';
import 'package:eng_center/features/pages_data/domain/repository/pages_data_repository.dart';
import 'package:eng_center/features/pages_data/domain/usecases/get_main_page_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late MockProductRepository productRepository;
  late GetAllMainPageProduct getMainPageProduct;

  setUp(() {
    productRepository = MockProductRepository();
    getMainPageProduct =
        GetAllMainPageProduct(productRepository: productRepository);
  });

  final Product product1 = Product(
      vendorId: '2',
      alpha: '20',
      id: '3',
      imageUrl: 'anythin',
      name: 'watches',
      price: '1500');
  final Product product2 = Product(
      vendorId: '2',
      alpha: '20',
      id: '4',
      imageUrl: 'anythin',
      name: 'watches',
      price: '1500');
  final Product product3 = Product(
      vendorId: '2',
      alpha: '20',
      id: '5',
      imageUrl: 'anythin',
      name: 'watches',
      price: '1500');

  final PageProducts pageProducts =
      PageProducts(products: [product1, product2, product3]);

  test("testing abstract repo", () async {
    when(productRepository
            .getMainPageProduct(pageNumber: 2, showed: ["1", "3"]))
        .thenAnswer((realInvocation) async => Right(pageProducts));

    final pageProductTesting = await getMainPageProduct.call(
        GetAllMainPageProductInput(pageNumber: 2, showedProduct: ["1", "3"]));

    expect(pageProductTesting, Right(pageProducts));
  });
}
