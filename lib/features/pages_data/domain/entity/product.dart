// ignore_for_file: public_member_api_docs, sort_constructors_first

class Product {
  String id;
  String name;
  String price;
  String imageUrl;
  String vendorId;
  String alpha;
  Product({
    required this.id,
    required this.name,
    required this.vendorId,
    required this.price,
    required this.imageUrl,
    required this.alpha,
  });
}

class PageProducts {
  List<Product> products;
  PageProducts({
    required this.products,
  });
}
