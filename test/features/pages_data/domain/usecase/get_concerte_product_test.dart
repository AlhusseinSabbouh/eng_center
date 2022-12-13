import 'package:dartz/dartz.dart';
import 'package:eng_center/features/pages_data/domain/entity/product.dart';
import 'package:eng_center/features/pages_data/domain/repository/pages_data_repository.dart';
import 'package:eng_center/features/pages_data/domain/usecases/get_concerte_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late MockProductRepository mockProductRepository;
  late GetConcerteProduct useCase;

  setUp(() {
    mockProductRepository = MockProductRepository();
    useCase = GetConcerteProduct(productRepository: mockProductRepository);
  });
  final Product product1 = Product(
      vendorId: '2',
      alpha: '20',
      id: '3',
      imageUrl: 'anythin',
      name: 'watches',
      price: '1500');
  test("test get concerte product by Id", () async {
    //arrange
    when(mockProductRepository.getConcerteProduct(productId: "3"))
        .thenAnswer((realInvocation) async => Right(product1));
    //act
    final result = await useCase("3");
    //assert
    expect(result, Right(product1));
  });
}
