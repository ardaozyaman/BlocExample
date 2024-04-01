import '../models/product.dart';

class ProductService {
  static List<Product> products = [];

  static final ProductService _singleton = ProductService._internal();

  ProductService._internal();

  factory ProductService(){
    return _singleton;
  }

  static List<Product> getAll (){

    products.add(Product(1, "Monster",20000));
    products.add(Product(2, "Hp",10000));
    products.add(Product(3, "Msi",15000));

    return products;
  }
}